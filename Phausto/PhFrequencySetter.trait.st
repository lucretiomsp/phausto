"
Setter trait for UnitGenerators that have a frequency parameter not related to a filter
"
Trait {
	#name : 'PhFrequencySetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhFrequencySetter >> freq: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFrequencySetter >> frequency: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFrequencySetter >> pitch: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
