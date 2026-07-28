"
I am a trait setter for UnitGeneratiors with bias related parameters
"
Trait {
	#name : 'PhBiasSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhBiasSetter >> biasAttack: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhBiasSetter >> biasDecay: aNumberOrABoxOrASymbol [

		self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhBiasSetter >> biasRelease: aNumberOrABoxOrASymbol [

		self paramSetter value: aNumberOrABoxOrASymbol
]
