
utils = 
    sum : ->
        
        return @reduce ((memo,n)->n+memo),0

    reject : (cond) ->

        return (elem for elem in @ when not cond(elem))
    
    detect : (cond) ->
        elems = (elem for elem in @ when cond(elem))
        return if elems.length == 1 then elems[0] else null

    sortComparables : ->
        
        if @length < 2 then return @

        return @sort (a,b) -> a.compareTo b

    pluck : (prop) ->
        @map((e) -> e[prop])

    dup : -> @slice()

    remove : (e) -> 
        res = @dup()
        res.splice @indexOf(e), 1
        return res
    
    removeAll : (other) -> 
        @filter (e) -> 
            other.indexOf(e) < 0

    unique: -> 
        @filter (e, index, array) -> 
            array.indexOf(e) == index
    
    max: ->
        return null if @.length == 0
        max = @[0]
        @forEach (e) -> 
            if e?.isGreaterThan max
                max = e
    
        return max
    
    min: ->
        return null if @.length == 0
        min = @[0]
        @forEach (e) -> 
            if e?.isLesserThan min
                min = e
        
        return min

    contains : (e) ->
        return @indexOf(e)>=0

    shuffle: ->

        # From the end of the list to the beginning, pick element `i`.
        for i in [@.length-1..1]
            # Choose random element `j` to the front of `i` to swap with.
            j = Math.floor Math.random() * (i + 1)
            # Swap `j` with `i`, using destructured assignment
            [@[i], @[j]] = [@[j], @[i]]

    pickRandom : ->
        
        if @length == 0 
            return null

        i = Math.floor(Math.random() * @length)
        return @[i]

    isEmpty : -> @length == 0
    
    cycle: (nb,cb)->
        if nb? and cb?
            nb.times =>
                for elem in @
                    cb(elem)
            return

        if nb? and not cb?
            cb = nb
            nb = "infinity!"
            #todo return an iterator


    head : -> @[0]

    tail : -> @[1..@length-1]

    init: -> @[0..@length-2]

    last: -> @[@length-1]

    combinations : (k) ->
    
        if k > @length or k <= 0
            return []
            
        if k == @length
            return [@]
        
        
        if k == 1
            return ([elem] for elem in @)
        
        combs = []
        for i in [0..(@length - k + 1)]
            head = @slice(i, i+1)
            tailcombs = @slice(i + 1).combinations(k - 1)
            for tailcomb in tailcombs
                combs.push(head.concat(tailcomb))
        
        return combs
    
    compareTo : (other) -> return @length - other.length

for own methodName,method of require './comparable'

    utils[methodName] = method

    
utils.install = ->

    for methodName,method of utils

        if not Array::[methodName]? and methodName isnt "install"

            Array::[methodName] = method

    Object::isArray = -> Object::toString.call(@) == '[object Array]'

module.exports = utils