threes = (require './fives.js').levels
sevens = (require './sevens.js').levels

threesTop = [0...8]
sevensTop = [32, 41, 77, 135, 137, 170]
sevensMeh = [25, 38, 43, 45, 62, 65, 83, 95, 148, 174, 226]
sequence = [208, 209, 210, 211, 213, 215, 218, 223]

levels = [threes[i] for i in threesTop][0]
levels = levels.concat [sevens[i] for i in sevensTop][0]
levels = levels.concat [sevens[i] for i in sevensMeh][0]
levels = levels = levels.concat [sevens[i] for i in sequence][0]

triangles = [
    {   
        data: [
            1, 4, 1, 4, 1
            3, 1, 1, 1, 1
            1, 4, 1, 0, 0
            1, 3, 1, 1, 1
            1, 1, 1, 2, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "tri.2 - trying"
    }
    {   
        data: [
            1, 0, 1, 1, 1
            1, 0, 1, 5, 1
            1, 1, 1, 1, 1
            1, 2, 1, 1, 5
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "tri.2 - easy"
    }
    {   
        data: [
            1, 1, 3, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 5
            1, 1, 1, 1, 1
            1, 1, 2, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "tri.2 - diffuse"
    }
    {   
        data: [
            1, 1, 1, 1, 1
            5, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 2, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "tri.1\nredo this"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 0, 1, 1
            1, 2, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "tri.3"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 5, 1, 1
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 3, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "tri.4"
    }
]

levels = levels.concat triangles

basics = [
    {   
        data: [
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "1"
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
        name: "2"
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
        name: "3"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 1, 1, 0, 1
            1, 1, 1, 0, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5}
        name: "3.1"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 0
            1, 0, 1, 1, 0
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "3.2"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 0, 1
            1, 1, 1, 0, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "3.4"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 0, 0, 1
            1, 1, 1, 0, 1
            1, 1, 1, 0, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "3.5"
    }
]

dvaVariations = [
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 0, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "dva.0"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "dva.1"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 0, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "dva.2"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 0, 1, 0
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "dva.5 (maybe)"
    }
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 1, 1
            1, 1, 0, 1, 1
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "dva.10 (hm)"
    }
]


intermediate = [
    {
        data: [
            1, 1, 1, 1, 1
            1, 0, 1, 0, 1
            1, 0, 1, 0, 1
            1, 1, 1, 1, 1
            1, 1, 0, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "4"
    }
    # {
    #     data: [
    #         1, 1, 1, 1, 1
    #         1, 0, 1, 0, 1
    #         1, 0, 1, 0, 1
    #         1, 1, 1, 1, 1
    #         1, 1, 0, 1, 1
    #     ]
    #     dimensions: {x: 5, y: 5} 
    #     name: "5"
    # }
    # {
    #     data: [
    #         1, 1, 1, 1, 1
    #         1, 0, 1, 0, 1
    #         1, 0, 1, 0, 1
    #         1, 1, 1, 1, 1
    #         1, 1, 0, 1, 1
    #     ]
    #     dimensions: {x: 5, y: 5} 
    #     name: "5"
    # }
    # {
    #     data: [
    #         1, 1, 1, 1, 1
    #         1, 0, 1, 0, 1
    #         1, 0, 1, 0, 1
    #         1, 1, 1, 1, 1
    #         1, 1, 0, 1, 1
    #     ]
    #     dimensions: {x: 5, y: 5} 
    #     name: "5"
    # }
    # {
    #     data: [
    #         1, 1, 1, 1, 1
    #         1, 0, 1, 0, 1
    #         1, 0, 1, 0, 1
    #         1, 1, 1, 1, 1
    #         1, 1, 0, 1, 1
    #     ]
    #     dimensions: {x: 5, y: 5} 
    #     name: "5"
    # }
    # {
    #     data: [
    #         1, 1, 1, 1, 1
    #         1, 0, 1, 0, 1
    #         1, 0, 1, 0, 1
    #         1, 1, 1, 1, 1
    #         1, 1, 0, 1, 1
    #     ]
    #     dimensions: {x: 5, y: 5} 
    #     name: "5"
    # }
    # {
    #     data: [
    #         1, 1, 1, 1, 1
    #         1, 0, 1, 0, 1
    #         1, 0, 1, 0, 1
    #         1, 1, 1, 1, 1
    #         1, 1, 0, 1, 1
    #     ]
    #     dimensions: {x: 5, y: 5} 
    #     name: "5"
    # }
]

# levels = ((basics.concat dvaVariations).concat intermediate).concat triangles
# levels = threes
# levels = sevens

module.exports = { levels }