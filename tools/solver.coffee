solve = (state) ->
    directions = surroundings state # get a list of available moves
    solution = state
    for direction in directions # apply each direction towards a recursive function
        next = move direction, copy state # get next position
        solution = solve next # solve the (smaller) problem
        if win solution
            solution.solved = true
            break
    solution

win = (state) ->
    0 is state.level.reduce ((pv, cv) -> pv + cv), 0

surroundings = (state) ->
    dirs = [
        {x: -1, y: 0}
        {x: 0, y: -1}
        {x: 1, y: 0}
        {x: 0, y: 1}
    ]
    dirs.filter (d) -> is_available d, state 

get = (position) -> position.y * 5 + position.x

is_available = (direction, state) ->
    np = nextpos direction, state
    if np.x < 0 or np.x > 4 then return false
    if np.y < 0 or np.y > 4 then return false
    state.level[get np] != 0

nextpos = (direction, state) -> {
        x: state.position.x + direction.x
        y: state.position.y + direction.y
    }

move = (direction, state) ->
    state.solution.push direction
    while is_available direction, state
        np = nextpos direction, state
        idx = get np
        if state.level[idx] is 2 then direction = {x:  0, y: -1}
        if state.level[idx] is 3 then direction = {x:  1, y:  0}
        if state.level[idx] is 4 then direction = {x:  0, y:  1}
        if state.level[idx] is 5 then direction = {x: -1, y:  0}
        state.level[idx] = 0
        state.position = np
    state   

setup = (state) ->
    if state.level[get state.position] != 1
        return null
    state.level[get state.position] = 0
    state

init = (level, x, y)->
    {
        level: [i for i in level][0]
        start : {
            x: null
            y: null
        }
        position: {
            x: x
            y: y
        }
        solved: false
        solution: []
    }

prettyprint = (state) ->
    console.log '---------------------------'
    for y in [0..4]
        row = ''
        for x in [0..4]
            p = {x: x, y: y}
            if p.x is state.position.x and p.y is state.position.y
                row += 'O '
            else
                if state.level[get p] is 1
                    row += '  '
                else
                    row += 'X '
        console.log row
    console.log state.solution
    console.log '---------------------------'

copy = (state) ->
    result = {}
    result.level = []
    result.level.push i for i in state.level
    result.position = {x: state.position.x, y: state.position.y}
    result.solved = state.solved
    result.solution = []
    result.solution.push s for s in state.solution
    result

makesolve = (level) ->
    solutions = []
    for x in [0..4]
        result = {}
        for y in [0..4]
            state = new init level, x, y
            state = setup state
            if state isnt null
                start = state.position # cache starting position
                result = solve state
                if result.solved is true
                    # console.log start
                    # prettyprint result
                    solutions.push result
    return solutions

module.exports = { makesolve }
