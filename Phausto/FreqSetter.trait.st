"
Set the frequency variable of the UnitGenerator to a PhBox, or changes its labels, or set its initialized value
"
Trait {
	#name : 'FreqSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'accessing' }
FreqSetter >> freq: aNumberOrABoxOrASymbol [

	| methodName |
	methodName := thisContext selector. "Get the name of this method"

	methodName asString allButLast traceCr.
	aNumberOrABoxOrASymbol
		asParam: methodName asString allButLast
		forUGen: self
]
