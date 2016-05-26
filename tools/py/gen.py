copy = lambda level: [i for i in level]

def block(count, level, start, accumulator):
    for i in range(start, 25 - count):
        if level[i] != 0:
            result = copy(level)
            result[i] = 0
            if count > 0: block(count - 1, result, i + 1, accumulator)
            else: accumulator.append(result)
    return accumulator

def hop(count, level, start, accumulator):
    for i in range(start, 25 - count):
        if level[i] == 1:
            result = copy(level)
            result[i] = 6
            if count > 0: hop(count - 1, result, i + 1, accumulator)
            else: accumulator.append(result)
    return accumulator

gen = lambda count, w, h: block(count, [1 for i in range(0, w * h)], 0, [])

# def makefile(i):
#     f = open(str(i) + ".js", 'w')
#     f.write("levels = " + str(gen((i), 5, 5)))
#     f.write("\nmodule.exports = { levels }")
#     f.close()

def makefile(lvls, name):
    f = open(name + '.js', 'w')
    f.write("levels = [")
    for i, lvl in enumerate(lvls):
        f.write("{\n    data: " + str(lvl) + ",\n")
        f.write("    dimensions: {x: 5, y: 5},\n    name: \"" + name + "." + str(i) + "\"\n}")
        if i == len(lvls) - 1:
            f.write(']\n')
        else:
            f.write(',\n')
    f.write('\nmodule.exports = { levels: levels }\n')
    f.close()

# for i in range(1, 10):
#     makefile(i)
