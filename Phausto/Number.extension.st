Extension { #name : 'Number' }

{ #category : '*Phausto' }
Number >> asBox [

BoxAPI uniqueInstance createLibContext .
	self isInteger
		ifTrue: [ ^ BoxAPI uniqueInstance boxInt: self ]
		ifFalse: [ ^ BoxAPI uniqueInstance boxReal: self ]
]

{ #category : '*Phausto' }
Number >> asParam: aString forUGen: aUnitGenerator [
	"change the label of the UI element to self"

	| uiElement |
	uiElement := aUnitGenerator perform: aString asSymbol.
	uiElement init: self.
	aUnitGenerator instVarNamed: aString put: uiElement


	"freq := aNumberOrABox isNumber
		        ifTrue: [ self freq init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ]"
]

{ #category : '*Phausto' }
Number >> midiNoteToFreq [
	"Convert Midi note number to frequency"

	| baseFreq |
	baseFreq := 440.0. "Standard tuning frequency for A4"
	^ (baseFreq * (2 raisedTo: self - 69 / 12.0)) asFloat
]
