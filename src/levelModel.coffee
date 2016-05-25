### level model values & functions: ###
model = (controller) ->
    @controller = controller
    @state = new () -> {
        get: (input) -> @level[@idx input]
        idx: (input) -> @dimensions.x * input.y + input.x
        is_available: (direction) ->
            np = @step direction
            if np.x < 0 or np.x >= @dimensions.x then return false
            if np.y < 0 or np.y >= @dimensions.y then return false
            @level[@idx np] != 0
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

    @new = (level) ->
        @state.level = [i for i in level.data][0]
        @state.dimensions = level.dimensions
        @state.position = undefined
        @state.name = level.name
        return

    @set_position = (tilexy) ->
        if (@state.get tilexy) == 1
            @state.position = tilexy
            tinfo = @state.level[ @state.idx @state.position ]
            @state.level[ @state.idx @state.position ] = 0
            return true
        return false

    @move = (direction) ->
        path = []
        while @state.is_available direction
            np = @state.step direction
            idx = @state.idx np
            if @state.level[idx] is 1
                if direction.x != 0
                    direction.x /= Math.abs(direction.x)
                if direction.y != 0
                    direction.y /= Math.abs(direction.y)
            if @state.level[idx] is 2 then direction = {x:  0, y: -1}
            if @state.level[idx] is 3 then direction = {x:  1, y:  0}
            if @state.level[idx] is 4 then direction = {x:  0, y:  1}
            if @state.level[idx] is 5 then direction = {x: -1, y:  0}
            if @state.level[idx] is 6 
                direction.x *= 2
                direction.y *= 2
            if @state.level[idx] is 7
                direction = @clockwise direction
            if @state.level[idx] is 8
                direction = @counterclockwise(direction)
            @state.level[@state.idx np] = 0
            @state.position = np
            path.push np
        if @checkwin()
            controller.advance()
            return []
        else if @checkstuck()
            controller.reset()   
            return []  
        path

    @clockwise = (direction) ->
        result = {}
        if direction.y == 0
            result.y = direction.x
            result.x = 0
        else if direction.x == 0
            result.x = -direction.y
            result.y = 0
        result

    @counterclockwise = (direction) ->
        direction = @clockwise direction
        direction.x *= -1
        direction.y *= -1
        direction

    steppify = (i) -> i / Math.abs i
    @clicked = (tilexy) ->
        if @state.position is undefined
            if @set_position tilexy
                return [tilexy]
            return []
        if tilexy.x is @state.position.x
            dy = steppify tilexy.y - @state.position.y
            result = [@state.position].concat if dy != 0 then @move {x: 0, y: dy} else []
            return result
        if tilexy.y is @state.position.y
            dx = steppify tilexy.x - @state.position.x
            result = [@state.position].concat if dx != 0 then @move {x: dx, y: 0} else []
            return result
        []

    @checkwin = () -> 0 is @state.level.reduce ((pv, cv) -> pv + cv), 0
    @checkstuck = () ->
        result = [(@state.is_available d) for d in dirs][0].filter (i) -> i is true 
        return result.length == 0
    return this

module.exports = { model }