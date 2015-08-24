
utils = 
    sleep : (time, callback)->

        stop = new Date().getTime()
        while (new Date().getTime() < stop + time)
            ;
        
        callback?()

module.exports = utils