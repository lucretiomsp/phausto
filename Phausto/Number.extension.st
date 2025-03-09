Extension { #name : 'Number' }

{ #category : '*Phausto' }
Number >> asBox [

BoxAPI uniqueInstance createLibContext .
	self isInteger
		ifTrue: [ ^ BoxAPI uniqueInstance boxInt: self ]
		ifFalse: [ ^ BoxAPI uniqueInstance boxReal: self ]
]

{ #category : '*Phausto' }
Number >> asConst [

"syntactis sugar for asBox"
^ self asBox.
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
Number >> midiNNToFreq [
	"This method is a copy of midiNoteToFreq in Coypu package"

	| baseFreq |
	baseFreq := 440.0. "Standard tuning frequency for A4"
	^ (baseFreq * (2 raisedTo: self - 69 / 12.0)) asFloat
]
