threes = (require './fives.js').levels
sevens = (require './sevens.js').levels
twohops = (require './2hops.js').levels
threehops = (require './3hops.js').levels

threesTop = [0...8]
sevensTop = [32, 41, 77, 135, 137, 170]
sevensMeh = [25, 38, 43, 45, 62, 65, 83, 95, 148, 174, 226]
sequence = [208, 209, 210, 211, 213, 215, 218, 223]

hoppy = [
    {
        data: [1, 0, 1, 1, 1, 1, 6, 1, 1, 1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        dimensions: {x: 5, y: 5}
        name: 'hoppy 0'
    }
    {
        data: [1, 0, 1, 1, 1, 1, 1, 1, 6, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        dimensions: {x: 5, y: 5}
        name: 'hoppy 2'
    }
    {
        data: [1, 0, 1, 1, 1, 1, 1, 1, 6, 1, 1, 1, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
        dimensions: {x: 5, y: 5}
        name: 'hoppy 3'
    }
]

triangles = [
    {
        data: [
            1, 0, 1, 1, 1, 
            1, 1, 1, 1, 1, 
            6, 1, 1, 1, 1, 
            1, 1, 1, 1, 1, 
            1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "TEST 3 SOLUTIONS"        
    }

    {
        data: [
            1, 0, 6, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1
        ]
        dimensions: {x: 5, y: 5}
        name: "TEST 11 SOLUTIONS"
    }


    {
        data: [
            1, 1, 1, 1, 1
            1, 1, 1, 1, 1
            1, 1, 6, 0, 1
            1, 1, 1, 1, 1
            1, 1, 6, 1, 1
        ]
        dimensions: {x: 5, y: 5} 
        name: "TEST HOP"        
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
]

# levels = triangles
levels = hoppy
levels = levels.concat twohops
levels = levels.concat threehops
levels = levels.concat (threes[i] for i in threesTop)
levels = levels.concat (sevens[i] for i in sevensTop)
levels = levels.concat (sevens[i] for i in sevensMeh)
levels = levels.concat (sevens[i] for i in sequence)



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