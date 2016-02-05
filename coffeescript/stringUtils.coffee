require("./arrayUtils").install()
require("./numberUtils").install()

utils =

    contains : (str) -> return @indexOf(str)>=0

    toInt : -> return parseInt(@,10)

    startsWith : (str) -> return @indexOf(str) == 0
    
    endsWith : (str) -> return @indexOf(str) == (@length-1)
    
    replaceAll : (str1,str2) -> return @replace(new RegExp(str1, 'g'), str2)
    
    isEmpty : () -> return @ is null or @ is ""

    repeat : (n)-> return Array(n).join(@)

    compareTo : (other) -> return @localCompare(other)

    generateToken : (length)->

        token = ""
        length.times ->

            letter = 'abcdefghijklmnopqrstuvwxyz'.split('').pickRandom()[['toLowerCase','toUpperCase'].pickRandom()]()
            digit = [0..9].pickRandom()
            token += [letter,digit].pickRandom()

        return token

for own methodName,method of require './comparable'

    utils[methodName] = method

utils.install = ->

    for methodName,method of utils

        if not String::[methodName]? and (methodName isnt "install" or methodName isnt "generateToken")

            String::[methodName] = method

    if not String.generateToken?

        String.generateToken = utils.generateToken

module.exports = utils
