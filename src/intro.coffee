object = (endbus) ->
    @title = new PointText {
        bus: endbus
        point: view.size.multiply [0.5, 0.548]
        content: "PUZZLS"
        justification: 'center'
        fontSize: 77
        fillColor: 'black'
        onMouseDown: (event) -> 
            bus.signal "start"
    }
    @handle = new Layer(@title)
    return this

    ###@start = new PointText {
        point: view.size.multiply [0.5, 2 * 0.3]
        content: "start"
        justification: 'center'
        fontSize: 24
        fillColor: 'black'
        bus: endbus
    }###

    ###@tutorial = new PointText {
        point: view.center.add [0, 50]
        content: "tutorial"
        justification: 'left'
        fontSize: 24
        fillColor: 'black'
        bus: endbus
        onMouseDown: (event) -> bus.push "tutorial"
    }###

module.exports = { object }