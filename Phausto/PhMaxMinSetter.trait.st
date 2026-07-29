"
I am a trait for UnitGenerators with min/max parameters
"
Trait {
	#name : 'PhMaxMinSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhMaxMinSetter >> max: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhMaxMinSetter >> min: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
