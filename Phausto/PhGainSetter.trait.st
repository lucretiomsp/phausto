"
Gain related setter trait
"
Trait {
	#name : 'PhGainSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhGainSetter >> gain: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
