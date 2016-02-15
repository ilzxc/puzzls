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

tileAnimator = () ->
    @process = []
    @add = (tile, delay = 0) ->
        @process.push {
            start: new Date().getTime() + delay
            object: tile
        }
    @animate = (event) ->

view = (model, center) ->
    @model = model
    t = []
    for y in [0...model.state.dimensions.y]
        for x in [0...model.state.dimensions.x]
            t.push new tile x, y, 60, 60, this, model.state.get {x: x, y: y}
    @tiles = new Group t
    console.log @tiles
    w = 60 * model.state.dimensions.x
    h = 60 * model.state.dimensions.y
    @tiles.translate [center.x - (w * 0.5), center.y - (h * 0.5)]
    @signal = (tile) ->
        test = @model.clicked tile.info
        for step in test
            @tiles.children[ @model.state.idx step ].fillColor = 'green'
    return this

module.exports = { tile, view }