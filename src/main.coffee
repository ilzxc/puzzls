utils = require './display.js'
level = require './levelModel.js'
viewcontroller = require './levelViewController.js'
tc = require './titleCard.js'

main = () ->
    @current = new level.model()
    test = new viewcontroller.view @current, view.center
    @animator = test.animator
    return this

titleAnimator = () ->
    @result = new Path {
        next: 0
        cards: ['one', 'two', '3', 'four', 'five']
        obj: null
        go: () ->
            @obj = new tc.titleCard view.size, @cards[@next]
            @next += 1
        onFrame: (event) ->
            console.log 'title animator onFrame'
            if @obj != null
                diff = new Date().getTime() - @obj.started
                if diff < 2000
                    return
                else 
                    @obj.remove()
                    @obj = null
    }
    return @result

paper.install window
window.onload = () ->
    paper.setup 'puzzls'

    fc = utils.frameCounter view.size    
    app = new main()

    testing = new titleAnimator()
    testing.go()
