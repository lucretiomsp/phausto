"
Trait setter for UnitGenerators with single input
"
Trait {
	#name : 'PhInputSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait - inputs' }
PhInputSetter >> input: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
