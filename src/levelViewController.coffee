colorFree = '#F7F8B0'
colorTaken = '#FF4941'

tile = (x, y, w, h, bus, taken) ->
    result = [new Path.Rectangle {
        info: {x: x, y: y}
        taken: taken
        bus: bus
        topLeft: [0, 0]
        bottomRight: [w, h]
        radius: ((w + h) * 0.5) * 0.125
        strokeColor: 'black'
        strokeWidth: 2
        fillColor: if taken is 0 then colorTaken else colorFree
        onMouseDown: (event) -> 
            bus.signal this
        reset: () -> 
            @fillColor = if taken is 0 then colorTaken else colorFree
    }]
    makeTriangle = (angle) ->
        toAdd = new Path.RegularPolygon new Point(w * 0.5, h * 0.5), 3, 10
        toAdd.fillColor = toAdd.strokeColor = 'black'
        toAdd.rotate angle
        toAdd.onMouseDown = (event) -> @parent.children[0].onMouseDown event
        return toAdd
    makeCircle = () ->
        toAdd = new Path.Circle new Point(w * 0.5, h * 0.5), 10
        toAdd.fillColor = toAdd.strokeColor = 'black'
        return toAdd
    makeTurn = (left) ->
        toAdd = new Path.Arc new Point(w * 0.5, h * 0.5 + 10), new Point(w * 0.5 + (left * 10), h * 0.5), new Point(w * 0.5, h * 0.5 - 10)
        toAdd.closed = true
        toAdd.fillColor = toAdd.strokeColor = 'black'
        return toAdd
    if taken >= 2 and taken <= 5
        result.push makeTriangle 90 * (taken - 2)
    if taken == 6
        result.push makeCircle()
    if taken == 7
        result.push makeTurn 1
    if taken == 8
        result.push makeTurn -1 
    result = new Group result
    result.translate [x * w, y * h]
    return result

colorCrossfade = (string1, string2) ->
    hsv = ([string1, string2].map (i) -> new Color i).map (c) -> [c.hue, c.saturation, c.brightness]
    hsv.concat [hsv[1].map (num, idx) -> num - hsv[0][idx]]

tileAnimator = () ->
    data = colorCrossfade '#2EFB47', '#0BABDF'
    result = new Path {
        queue: []
        add: (tile, delay = 0) ->
            time = new Date().getTime() + delay
            duration = 350
            @queue.push {
                start: time
                duration: duration
                end: time + duration
                object: tile
                color_start: data[0]
                color_end: data[1]
                color_change: data[2]
            }
            return
        reset: () ->
            @queue.splice 0, @queue.length - 1
        onFrame: (event) ->
            current = new Date().getTime()
            removals = []
            for item, idx in @queue
                if current >= item.end
                    item.object.fillColor = { hue: item.color_end[0], saturation: item.color_end[1], brightness: item.color_end[2] }
                    removals.push idx
            for r in removals
                @queue.splice r, 1
            for each in (@queue.filter (i) -> current >= i.start)
                t = ((current - each.start) / each.duration)
                result = [0, 1, 2].map (i) -> t * each.color_change[i] + each.color_start[i]
                each.object.fillColor = { hue: result[0], saturation: result[1], brightness: result[2] }
            return
    }
    return result

view = (model, center) ->
    @animator = new tileAnimator()
    @model = model
    t = []
    for y in [0...model.state.dimensions.y]
        for x in [0...model.state.dimensions.x]
            t.push new tile x, y, 60, 60, this, model.state.get {x: x, y: y}
    @tiles = new Group t
    @name = new PointText {
        point: [5, 15]
        content: model.state.name
        fillColor: 'black'
    }
    w = 60 * model.state.dimensions.x
    h = 60 * model.state.dimensions.y
    @tiles.translate [center.x - (w * 0.5), center.y - (h * 0.5)]
    @signal = (tile) ->
        steps = @model.clicked tile.info
        for step, idx in steps
            @animator.add @tiles.children[ @model.state.idx step ], 70 * idx
    return this

module.exports = { tile, view }