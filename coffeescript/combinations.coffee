module.exports = (k) ->
	
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
