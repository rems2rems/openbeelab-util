module.exports = 

    extend : (obj, mixins...) ->
        for mixin in mixins
            for name, method of mixin
                obj[name] = method         
        obj

    include : (klass, mixins...) ->
        @extend klass::, mixins...
        return klass