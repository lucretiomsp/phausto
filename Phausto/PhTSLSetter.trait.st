"
Trig, Length, Step, Duration setters for interpolators
"
Trait {
	#name : 'PhTSLSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhTSLSetter >> duration: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - interpolators' }
PhTSLSetter >> length: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - interpolators' }
PhTSLSetter >> step: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - trigger' }
PhTSLSetter >> trig: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
