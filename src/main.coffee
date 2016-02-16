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
            @next = (@next + 1) % @cards.length
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

levels = [
    {   
        data: [
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
    }
    {   
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 1, 1, 1, 0
            1, 1, 1, 1, 0
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 0
            1, 1, 1, 1, 0
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 0, 1
            1, 0, 1, 0, 1
            1, 1, 1, 1, 1
            1, 1, 0, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
    }

]

paper.install window
window.onload = () ->
    paper.setup 'puzzls'

    fc = utils.frameCounter view.size    
    @model = new level.model this
    @current = 0
    @model.new levels[0]
    @vc = new viewcontroller.view @model, view.center
    @ta = new titleAnimator()
    @ta.go()
    
    @advance = () ->
        @current = (@current + 1) % levels.length
        @model.new levels[@current]
        @vc.tiles.remove()
        @vc = new viewcontroller.view @model, view.center
        @ta.go()
    @reset = () ->
        @model.new levels[@current]
        @vc.tiles.remove()
        @vc = new viewcontroller.view @model, view.center
        return