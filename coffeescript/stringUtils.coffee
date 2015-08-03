
utils = 

    contains : (str) -> return @indexOf(str)>=0

    toInt : -> return parseInt(@,10)
    
    startsWith : (str) -> return @indexOf(str) == 0
    
    endsWith : (str) -> return @indexOf(str) == (@length-1)
    
    replaceAll : (str1,str2) -> return @replace(new RegExp(str1, 'g'), str2)
    
    isEmpty : () -> return @ is null or @ is ""

    repeat : (n)-> return Array(n).join(@)

utils.install = ->

    for methodName,method of utils

        if not String::[methodName]? and methodName isnt "install"

            String::[methodName] = method

module.exports = utils