"
Filter related setters
"
Trait {
	#name : 'PhFilterSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhFilterSetter >> aN: aNumberOrABoxOrASymbol [

		self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFilterSetter >> b0: aNumberOrABoxOrASymbol [

		self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFilterSetter >> bM: aNumberOrABoxOrASymbol [

		self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - cutoff' }
PhFilterSetter >> cutoff: aNumberOrABoxOrASymbol [

	PhPsImpl paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - cutoff' }
PhFilterSetter >> cutoffFreq: aNumberOrABoxOrASymbol [

	PhPsImpl paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFilterSetter >> fr: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait - freq' }
PhFilterSetter >> frequency: aNumberOrABoxOrASymbol [

	PhPsImpl paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFilterSetter >> gain: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFilterSetter >> q: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhFilterSetter >> res: aNumberOrABoxOrASymbol [

	PhPsImpl paramSetter value: aNumberOrABoxOrASymbol
]
