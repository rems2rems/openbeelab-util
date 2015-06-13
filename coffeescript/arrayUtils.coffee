# Copyright 2012-2014 OpenBeeLab.
# This file is part of the OpenBeeLab project.

# The OpenBeeLab project is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# The OpenBeeLab project is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with OpenBeeLab.  If not, see <http://www.gnu.org/licenses/>.


module.exports = 
    
    sum : ->
        
        return @reduce ((memo,n)->n+memo),0

    reject : (cond) ->

        return (elem for elem in @ when not cond(elem))
    
    detect : (cond) ->
        elems = (elem for elem in @ when cond(elem))
        return if elems.length == 1 then elems[0] else null

    sortComparables : ->
        
        if @length == 0
            return []

        return @sort(@[0].constructor.comparator)

    pluck : (prop) ->
        @map((e) -> e[prop])

    dup : -> @slice()

    remove : (e) -> 
        @splice @indexOf(e), 1
        @
    
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
            if e?.greaterThan max
                max = e
    
        return max
    
    min: ->
        return null if @.length == 0
        min = @[0]
        @forEach (e) -> 
            if e?.lesserThan min
                min = e
        
        return min

    contain : (e) ->
        return @indexOf(e)>=0

    is_in : (collection) ->
        return collection.contain @.valueOf()

    not_in : (collection) ->
        return !@is_in(collection)

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
        nb.times =>
            @forEach cb

    head : -> @[0]

    tail : -> @[1..@length-1]

    init: -> @[0..@length-2]

    last: -> @[@length-1]

    isArray: -> Object::toString.call(@) == '[object Array]'




