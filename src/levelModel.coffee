### level model values & functions: ###
model = () ->
    @state = new () -> {
        level: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5}
        position: undefined
        get: (input) -> @level[@idx input]
        idx: (input) -> @dimensions.x * input.y + input.x
        is_available: (direction) ->
            np = @step direction
            if np.x < 0 or np.x >= @dimensions.x then return false
            if np.y < 0 or np.y >= @dimensions.y then return false
            @level[@idx np] is 1
        step: (direction) -> {
                x: @position.x + direction.x
                y: @position.y + direction.y
            }
        print: () ->
            for y in [0...@dimensions.y]
                row = ""
                for x in [0...@dimensions.x]
                    row += @level[ @idx {x: x, y: y} ] + " "
                console.log row
            console.log "position", @position
            return
    }

    dirs = [ {x: -1, y: 0}, {x: 0, y: -1}, {x: 1, y: 0}, {x: 0, y: 1} ]

    @set_position = (x, y) ->
        @state.position = {x: x, y: y}
        @state.level[ @state.idx @state.position ] = 0
        return

    @move = (direction) ->
        path = []
        while @state.is_available direction
            np = @state.step direction
            @state.level[@state.idx np] = 0
            @state.position = np
            path.push np
        return path

    steppify = (i) -> i / Math.abs i
    @clicked = (tilexy) ->
        if @state.position is undefined
            @set_position tilexy.x, tilexy.y
            return [tilexy]
        if tilexy.x is @state.position.x
            dy = steppify tilexy.y - @state.position.y
            console.log dy
            result = if dy != 0 then @move {x: 0, y: dy} else []
            return result
        if tilexy.y is @state.position.y
            dx = steppify tilexy.x - @state.position.x
            console.log dx
            result = if dx != 0 then @move {x: dx, y: 0} else []
            return result
        []

    @checkwin = () -> 0 is state.level.reduce ((pv, cv) -> pv + cv), 0
    
    return this

module.exports = { model }