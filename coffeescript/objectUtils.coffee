
utils =


    isIn : (collection) ->

        if @ instanceof Number or @ instanceof String or @ instanceof Boolean
            
            return collection.contains(@.valueOf()) or collection.contains(@)

        return collection.contains @

    clone : () ->
        
        #Handle the 3 simple types
        if @ instanceof Number or @ instanceof String or @ instanceof Boolean
            
            return @.valueOf()

        # Handle Date
        if @ instanceof Date
            
            copy = new Date()
            copy.setTime(@.getTime())
            return copy

        # Handle Array
        if @ instanceof Array
            
            copy = []
            for elem,i in @
                if not @[i]?
                    copy[i] = @[i]
                else
                    copy[i] = @[i].clone()
            
            return copy

        # Handle Object
        if @ instanceof Object
            
            copy = {}
            for own attr of @
                if not @[attr]?
                    copy[attr] = @[attr]
                else
                    copy[attr] = @[attr].clone()

            return copy

        throw new Error("Unable to copy obj! Its type isn't supported.")

utils.install = ->

    for own methodName,method of utils

        if not Object::[methodName]? and methodName isnt "install"

            Object::[methodName] = method

module.exports = utils