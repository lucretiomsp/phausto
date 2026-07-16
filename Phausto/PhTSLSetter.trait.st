"
Trig, Length, Step setters for interpolators
"
Trait {
	#name : 'PhTSLSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait - trigger' }
PhTSLSetter >> trig: aNumberOrABoxOrASymbol [

	PhPsImpl paramSetter value: aNumberOrABoxOrASymbol
]
