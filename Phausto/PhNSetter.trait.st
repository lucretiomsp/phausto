"
Parameter setter for n: (usage differs between classes)
"
Trait {
	#name : 'PhNSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'accessing' }
PhNSetter >> n: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
