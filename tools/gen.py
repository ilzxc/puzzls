level = [1 for i in range(0, 25)]
copy = lambda level: [i for i in level]

def block(count, level, start, accumulator):
    for i in range(start, 25 - count):
        if level[i] != 0:
            result = copy(level)
            result[i] = 0
            if count >= 1: block(count - 1, result, i + 1, accumulator)
            else: accumulator.append(result)
    return accumulator

gen = lambda count, w, h: block(count, [1 for i in range(0, w * h)], 0, [])

def makefile(i):
    f = open(str(i) + ".js", 'w')
    f.write("levels = " + str(gen((i - 1), 5, 5)))
    f.write("\nmodule.exports = { levels }")
    f.close()

for i in range(1, 10):
    makefile(i)