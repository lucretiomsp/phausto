Extension { #name : 'Array' }

{ #category : '*Phausto' }
Array >> asParam: aString forUGen: aUnitGenerator [
	"change init, min, max, step of the UI element to the array value"

	| uiElement |
	uiElement := aUnitGenerator perform: aString asSymbol.
	uiElement
		init: self first;
		min: (self at: 2);
		max: (self at: 3);
		step: self last.

	aUnitGenerator instVarNamed: aString put: uiElement
]
