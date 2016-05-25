solver = (require './solver.js').makesolve
levels =(require './1.js').levels

compare = (a, b) -> (v == b[i] for v,i in a).reduce ((x,y) -> x & y), true

get = (x, y, w) -> w * y + x

rotate = (a) ->
    w = h = 5
    result = []
    for i in [0...h]
        for j in [0...w]
            result[get i, j, w] = a[get (w - j - 1), i, w]
    result

solvables = []
for l in levels
    lvl = (i for i in l)
    solutions = solver lvl
    if solutions.length == 0
        solvables.push l

result = []
for s in solvables
    r1 = rotate s
    r2 = rotate r1
    r3 = rotate r2
    isthere = 0
    for r in result
        predicate = [
            compare r1, r
            compare r2, r
            compare r3, r
        ]
        isthere = predicate.reduce ((a,b) -> a + b), 0
        if isthere != 0 then break
    if isthere is 0
        result.push s

console.log "levels = ["
for l, counter in result
    console.log "{"
    console.log "data: [" + l + "],"
    console.log "dimensions: {x: 5, y: 5},"
    console.log "name: \"" + counter + "\""
    console.log "},"
console.log "]\nmodule.exports = { levels: levels }\n"
