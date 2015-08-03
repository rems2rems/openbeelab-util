methods = 
    
    isLesserThan : (other) ->
        return @compareTo(other) < 0
    
    isGreaterThan : (other) ->
        return @compareTo(other) > 0
    
    equals : (other) ->
        return @compareTo(other) == 0
        
    isLesserOrEqualThan : (other) ->
        return @compareTo(other) <= 0
        
    isGreaterOrEqualThan : (other) ->
        return @compareTo(other) >= 0
        
    isBetween : (min,max) ->
        return @isGreaterOrEqualThan(min) and @isLesserOrEqualThan(max)

    isOutside : (min,max) ->
        return not @isBetween(min,max)

module.exports = methods