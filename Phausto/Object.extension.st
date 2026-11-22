Extension { #name : 'Object' }

{ #category : '*Phausto' }
Object >> asFaustArgument [
	"Faust code of the receiver when it is the argument of a physmodels.lib function (see PhPmFunction)"

	^ '(' , self asBox asFaustCode trimBoth , ')'
]
