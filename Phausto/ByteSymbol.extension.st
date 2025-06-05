Extension { #name : 'ByteSymbol' }

{ #category : '*Phausto' }
ByteSymbol >> asParam: aString forUGen: aUnitGenerator [
	"change the label of the UI element to self"

	| uiElement |
	uiElement := aUnitGenerator perform: aString asSymbol.
	uiElement label: self.

	aUnitGenerator instVarNamed: aString put: uiElement.

	"change corresponding controlParameter label"
	"(aUnitGenerator controlParameters at: aString asSymbol) label: self"
]

{ #category : '*Phausto' }
ByteSymbol >> asPhButton [
	"shortcut to create an horizontal slider for Phausto (with range #(0 - 1), an initvalue 0.5 and step 0.001) "

	^ (PhButton new label: self asString) asBox
]

{ #category : '*Phausto' }
ByteSymbol >> asPhHSlider [
	"shortcut to create an horizontal slider for Phausto (with range #(0 - 1), an initvalue 0.5 and step 0.001) "

	^ (PhHSlider new
		   label: self asString
		   init: 0.5
		   min: 0
		   max: 1
		   step: 0.001) asBox
]

{ #category : '*Phausto' }
ByteSymbol >> changeLabelOrInitialValue: aNumberOrABoxOrASymbol forUGen: aUGen [

	aNumberOrABoxOrASymbol
		asParam: self asString allButLast
		forUGen: aUGen
		
	
]
