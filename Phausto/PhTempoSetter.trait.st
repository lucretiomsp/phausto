"
Tempo related parameter setter
"
Trait {
	#name : 'PhTempoSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhTempoSetter >> tempo: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
