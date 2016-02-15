tile = (x, y, w, h, bus, taken) ->
    result = new Path.Rectangle {
        info: {x: x, y: y}
        taken: taken
        bus: bus
        topLeft: [0, 0]
        bottomRight: [w, h]
        radius: ((w + h) * 0.5) * 0.125
        strokeColor: 'black'
        strokeWidth: 2
        fillColor: if taken is 0 then {
                gradient: { stops: ['yellow', 'red', 'red'], radial : true }
                origin: [0, 0]
                destination: [w, h]
            } else { 
                gradient: { stops: ['white', 'grey', 'grey'], radial: true }
                origin: [0, 0]
                destination: [w, h]
            }
        onMouseDown: (event) -> 
            bus.signal this
    }
    result.translate [x * w, y * h]
    return result

colorCrossfade = (string1, string2) ->
    hsv = ([string1, string2].map (i) -> new Color i).map (c) -> [c.hue, c.saturation, c.brightness]
    hsv.concat [hsv[1].map (num, idx) -> num - hsv[0][idx]]

tileAnimator = () ->
    @queue = []
    data = colorCrossfade '#2EFB47', '#0BABDF'
    @add = (tile, delay = 0) ->
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
    @animate = (event) ->
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
    return this

view = (model, center) ->
    @animator = new tileAnimator()
    @model = model
    t = []
    for y in [0...model.state.dimensions.y]
        for x in [0...model.state.dimensions.x]
            t.push new tile x, y, 60, 60, this, model.state.get {x: x, y: y}
    @tiles = new Group t
    w = 60 * model.state.dimensions.x
    h = 60 * model.state.dimensions.y
    @tiles.translate [center.x - (w * 0.5), center.y - (h * 0.5)]
    @signal = (tile) ->
        test = @model.clicked tile.info
        for step, idx in test
            @animator.add @tiles.children[ @model.state.idx step ], 70 * idx
    return this

module.exports = { tile, view }