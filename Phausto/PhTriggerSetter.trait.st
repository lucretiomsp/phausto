"
Pararam setter for UGens using triggers
"
Trait {
	#name : 'PhTriggerSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait - trigger' }
PhTriggerSetter >> gate: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - trigger' }
PhTriggerSetter >> trig: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - trigger' }
PhTriggerSetter >> trigger: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
