utils = require './display.js'
level = require './levelModel.js'
viewcontroller = require './levelViewController.js'

main = () ->
    @current = new level.model()
    ###    console.log "--------------------------------"
    @current.state.print()
    @current.set_position 3, 3
    console.log "--------------------------------"
    @current.state.print()
    test = @current.move {x: -1, y: 0}
    console.log "test", test
    console.log "--------------------------------"
    @current.state.print()
    @current.move {x: 0, y: -1}
    console.log "--------------------------------"
    @current.state.print()
    @current.move {x: 1, y: 0}
    console.log "--------------------------------"
    @current.state.print()
    ###
    test = new viewcontroller.view @current, view.center
    return this

paper.install window
window.onload = () ->
    paper.setup 'puzzls'

    fc = utils.frameCounter view.size    

    app = new main()

    ###
    current = intro.object signal

    signal = (value) -> 
        if value == "start"
            current.handle.remove()
            current = new level.level("")
    ###