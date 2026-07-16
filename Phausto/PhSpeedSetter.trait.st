"
Parameter setter for UGens using speed
"
Trait {
	#name : 'PhSpeedSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhSpeedSetter >> speed: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
