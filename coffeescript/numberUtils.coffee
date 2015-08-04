utils =

    times : (fn) ->

        for i in [0...@valueOf()]
            fn(i)

    floor : ->

        return Math.floor(@)

    ceil : ->

        return Math.ceil(@)

    compareTo : (other) -> return @ - other

    getRandomArbitrary : (min, max)->

        return Math.random() * (max - min) + min

for own methodName,method of require './comparable'

    utils[methodName] = method

utils.install = ->

    for own methodName,method of utils

        if not Number::[methodName]? and (methodName isnt "install" or methodName isnt "getRandomArbitrary")

            Number::[methodName] = method

    if not Number.getRandomArbitrary?

        Number.getRandomArbitrary = utils.getRandomArbitrary

module.exports = utils