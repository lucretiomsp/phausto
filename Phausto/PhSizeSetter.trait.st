"
Size related setter, shared by GreyHole, JpVerb and PhAutomat
"
Trait {
	#name : 'PhSizeSetter',
	#category : 'Phausto-Traits',
	#package : 'Phausto',
	#tag : 'Traits'
}

{ #category : 'trait' }
PhSizeSetter >> size: aNumberOrABoxOrASymbol [

self paramSetter value: aNumberOrABoxOrASymbol
]
