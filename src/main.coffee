utils = require './display.js'
level = require './levelModel.js'
viewcontroller = require './levelViewController.js'
tc = require './titleCard.js'

titleAnimator = () ->
    @result = new Path {
        next: 0
        cards: ['one', 'two', '3', 'four', 'five']
        obj: []
        go: () ->
            @obj.push new tc.titleCard view.size, @cards[@next]
            @next += 1
        onFrame: (event) ->
            for o in @obj
                diff = new Date().getTime() - o.started
                if diff < 2000
                    return
                else 
                    o.remove()
                    @obj = []
    }
    return @result

paper.install window
window.onload = () ->
    paper.setup 'puzzls'

    fc = utils.frameCounter view.size    
    @current = new level.model this
    @vc = new viewcontroller.view @current, view.center
    @ta = new titleAnimator()
    @ta.go()
    
    @advance = () ->
        @current.new {
            data: [
                1, 1, 1, 1, 0
                1, 1, 1, 1, 0
                1, 1, 1, 1, 1
                1, 1, 1, 1, 1
                1, 1, 1, 1, 1
            ]
            dimensions: {x: 5, y: 5}
        }
        @vc.tiles.remove()
        @vc = new viewcontroller.view @current, view.center
        @ta.go()
    @reset = () ->
        @current.new {
            data: [
                1, 1, 1, 1, 1
                1, 0, 1, 1, 1
                1, 1, 1, 1, 1
                1, 1, 1, 1, 1
                1, 1, 1, 1, 1
            ]
            dimensions: {x: 5, y: 5}
        }
        @vc.tiles.remove()
        @vc = new viewcontroller.view @current, view.center
        return