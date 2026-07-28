"
I am a trait setter for UnitGenerators with modulating parameters
"
Trait {
	#name : 'PhModulationSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhModulationSetter >> modDepth: aNumberOrABoxOrASymbol [

self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'trait' }
PhModulationSetter >> modFreq: aNumberOrABoxOrASymbol [

	self paramSetter value: aNumberOrABoxOrASymbol
]
