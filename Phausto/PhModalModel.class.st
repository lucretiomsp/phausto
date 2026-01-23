"
Implement multiple resonance modes using **resonant bandpass filters**.
Any linear percussion instrument can be implemented using a bank of resonant bandpass filters and an exciter.
Lear more about [Physical Audio Signals](https://ccrma.stanford.edu/~jos/pasp/).

## Parameters
- **numberOfModes**: number of given modes
- **freqs** : list of filter center freqencies in Hertz
- **t60s** : list of mode resonance durations (in seconds)
- **gains** : list of mode gains (0-1)
- **input** : the excitation input
"
Class {
	#name : 'PhModalModel',
	#superclass : 'UnitGenerator',
	#instVars : [
		'numberOfModes',
		'freqs',
		't60s',
		'gains',
		'input'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
PhModalModel >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	"finalBox := self freqs asBox , self t60s asBox , self gains asBox
	            , self input asBox connectTo: intermediateBox."
	finalBox := self freqs asBox , self t60s asBox , self gains asBox asBox , self input asBox
		            connectTo: intermediateBox.
	^ intermediateBox
]

{ #category : 'accessing' }
PhModalModel >> freqs [

	^ freqs
]

{ #category : 'accessing' }
PhModalModel >> freqs: aParamArgumentOrAPhList [

	(aParamArgumentOrAPhList isKindOf: PhList)
		ifTrue: [ freqs := aParamArgumentOrAPhList ]
		ifFalse: [ self paramSetter value: aParamArgumentOrAPhList ]
]

{ #category : 'accessing' }
PhModalModel >> gains [

	^ gains
]

{ #category : 'initialization' }
PhModalModel >> initialize [
	"default ModalModel comes from the example in the Faust libraries documentation but is triggered with a Pulsen"
	self shouldBeImplemented 

"	super initialize.
	processExpression := 'process = pm.modalModel(1);'.
	freqs := #( 440 870 ) asPhZeroList.
	t60s := #( 0.5 0.25 ) asPhZeroList.
	gains := #( 0.6 0.8 ) asPhZeroList.
	input := Pulse new period: 0.16"
]

{ #category : 'accessing' }
PhModalModel >> input [

	^ input
]

{ #category : 'accessing' }
PhModalModel >> numberOfModes [

	^ numberOfModes
]

{ #category : 'accessing' }
PhModalModel >> numberOfModes: anInteger [

	numberOfModes := anInteger .
	self updateProcessExpression
]

{ #category : 'accessing' }
PhModalModel >> t60: aParamArgumentOrAPhList [
   
   (aParamArgumentOrAPhList isKindOf: PhList) ifTrue: [ t60s := aParamArgumentOrAPhList ] ifFalse:
	[self paramSetter value: aParamArgumentOrAPhList ]
]

{ #category : 'accessing' }
PhModalModel >> t60s [

	^ t60s
]

{ #category : 'as yet unclassified' }
PhModalModel >> updateLists [

	t60s := #( 0.5 0.2 0.3 0.1 ) asPhZeroList.
	freqs := #( 220 330 550 750 ) asPhZeroList.
	gains := #( 0.5 0.2 0.1 0.1 ) asPhZeroList
]

{ #category : 'utilities' }
PhModalModel >> updateProcessExpression [

	"| peStream |
	peStream := ReadWriteStream on: ''.
	peStream << 'process = pm.modalModel('.
	self numberOfModes printOn: peStream.
	peStream << ');'.
	processExpression := peStream contents."
	
	processExpression := 'process = pm.modalModel(4);'.
	
	self updateLists
]
