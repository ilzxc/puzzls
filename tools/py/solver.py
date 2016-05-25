class Point:
    """
    Point: a container with an x & y coordinate
    """
    x = 0
    y = 0

    def __init__(self, x_ = 0, y_ = 0):
        self.x = x_
        self.y = y_

    def __repr__(self):
        return self.__str__()

    def __str__(self):
        return "[x: " + str(self.x) + ", y: " + str(self.y) + "]"

class State:
    """
    State: a container of all data for the solver
    """
    level = []
    start = Point()
    position = Point()
    solved = False
    solution = []

    def __repr__(self):
        return self.__str__()

    def __str__(self):
        result = ''
        result += str(self.level) + '\n'
        result += "start    : " + str(self.start) + '\n'
        result += "position : " + str(self.position) + '\n'
        result += "solved   : " + str(self.solved) + '\n'
        result += str(self.solution)
        return result

def solve(state):
    """
    Recursive function for solving some initial state
    """
    directions = surroundings(state)
    solution = state
    for direction in directions:
        next = move(direction, copy(state))
        solution = solve(next)
        if win(solution):
            solution.solved = True
            break
    return solution

win = lambda state: sum(state.level) == 0

def surroundings(state):
    dirs = [
        Point(-1, 0),
        Point(0, -1),
        Point(0, 1),
        Point(1, 0)
    ]
    return [d for d in dirs if is_available(d, state)]

get = lambda position: position.y * 5 + position.x

def is_available(direction, state):
    np = nextpos(direction, state)
    if np.x < 0 or np.x > 4:
        return False
    if np.y < 0 or np.y > 4:
        return False
    return state.level[get(np)] != 0

def nextpos(direction, state):
    return Point(state.position.x + direction.x, state.position.y + direction.y)

def clockwise(direction):
    if direction.y == 0:
        direction.y = direction.x
        direction.x = 0
    elif direction.x == 0:
        direction.x = -direction.y
        direction.y = 0
    return direction

def counterclockwise(direction):
    if direction.y == 0:
        direction.y = -direction.x
        direction.x = 0
    elif direction.x == 0:
        direction.x = direction.y
        direction.y = 0
    return direction

def move(direction, state):
    """
    Performs move, marking all visited squares to 0
    """
    state.solution.append(direction)
    while is_available(direction, state):
        np = nextpos(direction, state)
        idx = get(np)
        if state.level[idx] is 1:
            direction = normalize(direction)
        elif state.level[idx] is 2:
            direction = Point(0, -1)
        elif state.level[idx] is 3:
            direction = Point(1, 0)
        elif state.level[idx] is 4:
            direction = Point(0, 1)
        elif state.level[idx] is 5:
            direction = Point(-1, 0)
        elif state.level[idx] is 6:
            direction = Point(direction.x * 2, direction.y * 2)
        elif state.level[idx] is 7:
            direction = clockwise(direction)
        elif state.level[idx] is 8:
            direction = counterclockwise(direction)
        state.level[idx] = 0
        state.position = np
    return state

def normalize(point):
    if (abs(point.x) + abs(point.y)) is 1:
        return point
    if point.x != 0:
        point.x = point.x / abs(point.x)
    if point.y != 0:
        point.y = point.y / abs(point.y)
    return point

def setup(state):
    if state.level[get(state.position)] != 1:
        return None
    state.level[get(state.position)] = 0
    return state

def init(level, x, y):
    result = State()
    result.level = [i for i in level]
    result.start = Point(x, y)
    result.position = Point(x, y)
    result.solved = False
    result.solution = []
    return setup(result)

def copy(state):
    result = State()
    result.level = [i for i in state.level]
    result.start = Point(state.start.x, state.start.y)
    result.position = Point(state.position.x, state.position.y)
    result.solved = state.solved
    result.solution = [s for s in state.solution]
    return result

def makeSolve(level):
    """
    Outputs all solutions for a given level.
    """
    solutions = []
    for x in range(5):
        for y in range(5):
            state = init(level, x, y)
            if state != None:
                start = state.position
                result = solve(state)
                if result.solved is True:
                    solutions.append(result)
    return solutions
