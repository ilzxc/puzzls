level = require './levelModel.js'
viewcontroller = require './levelViewController.js'
tc = require './titleCard.js'
levels = (require './levels.js').levels

titleAnimator = () ->
    @result = new Path {
        obj: []
        go: (name) ->
            @obj.push new tc.titleCard view.size, name
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

    @model = new level.model this
    @current = 0
    @model.new levels[0]
    @vc = new viewcontroller.view @model, view.center
    @ta = new titleAnimator()
    @ta.go levels[@current].name
    
    @advance = () ->
        @current = (@current + 1) % levels.length
        @model.new levels[@current]
        @vc.tiles.remove()
        @vc.name.remove()
        @vc = new viewcontroller.view @model, view.center
        @ta.go levels[@current].name
        
    @reset = () ->
        @model.new levels[@current]
        @vc.tiles.remove()
        @vc.name.remove()
        @vc = new viewcontroller.view @model, view.center
        return