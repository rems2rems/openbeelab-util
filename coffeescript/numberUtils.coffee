utils =

    times : (fn) ->

        for i in [0...@valueOf()]
            fn(i)

    floor : ->

        return Math.floor(@)

    ceil : ->

        return Math.ceil(@)

    compareTo : (other) -> return @ - other

for own methodName,method of require './comparable'

    utils[methodName] = method

utils.install = ->

    for own methodName,method of utils

        if not Number::[methodName]? and methodName isnt "install"

            Number::[methodName] = method

module.exports = utils