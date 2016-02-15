utils = require './display.js'
level = require './levelModel.js'
viewcontroller = require './levelViewController.js'

main = () ->
    @current = new level.model()
    test = new viewcontroller.view @current, view.center
    @animator = test.animator
    return this

paper.install window
window.onload = () ->
    paper.setup 'puzzls'

    fc = utils.frameCounter view.size    
    app = new main()

    view.onFrame = (event) ->
        app.animator.animate event
