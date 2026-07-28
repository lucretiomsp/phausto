"
I am a trait for Unit Generators with a period
"
Trait {
	#name : 'PhPeriodSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'accessing' }
PhPeriodSetter >> period: aNumberOrABoxOrASymbol [

	
	self paramSetter value: aNumberOrABoxOrASymbol
]
