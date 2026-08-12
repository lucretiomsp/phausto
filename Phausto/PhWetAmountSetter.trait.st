"
I am a trait for effects with wet/dry parameters
"
Trait {
	#name : 'PhWetAmountSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhWetAmountSetter >> wetAmount:  aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
