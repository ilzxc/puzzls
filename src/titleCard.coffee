titleCard = (size, cardtext) ->
    rect = new Path.Rectangle {
        topLeft: [0, 0]
        bottomRight: size
        fillColor: 'white'
    }

    text = new PointText {
        point: [size.width * .5, size.height * .5]
        content: cardtext
        justification: 'center'
        fontSize: 33
        fillColor: 'black'
    }

    @handle = new Group [rect, text]
    @handle.started = new Date().getTime()

    return @handle

module.exports = { titleCard }