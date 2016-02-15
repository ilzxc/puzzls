frameCounter = (size) ->
    console.log "greetings from frameCounter"
    return new PointText {
        point: size
        justification: 'right'
        fontSize: 8
        fillColor: 'black'
        onFrame: (event) -> @content = event.count
    }

module.exports = { frameCounter }