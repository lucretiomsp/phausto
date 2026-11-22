"
A simple acoustic guitar model with steel strings (based on guitarModel) implementing an excitation model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function.
"
Class {
	#name : 'Guitar',
	#superclass : 'StringInstruments',
	#instVars : [
		'freq',
		'pluckPosition',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
Guitar class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'the frequency in Hz'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#gain -> 'gain of the excitation'.
			#trigger -> 'trigger signal (1 for on, 0 for off)' }
]

{ #category : 'faust' }
Guitar class >> argumentNames [

	^ #( #freq #pluckPosition #gain #trigger )
]

{ #category : 'faust' }
Guitar class >> faustName [

	^ 'guitar'
]

{ #category : 'faust' }
Guitar >> faustArguments [

	"the Faust function wants the length of the string: my frequency is converted with pm.f2l"

	| arguments |
	arguments := super faustArguments copy.
	arguments at: 1 put: 'pm.f2l(' , freq asFaustArgument , ')'.
	^ arguments
]

{ #category : 'accessing' }
Guitar >> freq [

	^ freq
]

{ #category : 'accessing' }
Guitar >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Guitar >> gain [

	^ gain
]

{ #category : 'accessing' }
Guitar >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
Guitar >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 1200 1 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.8 0.01 0.99 0.01 ).
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
Guitar >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
Guitar >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Guitar >> trigger [

	^ trigger
]

{ #category : 'accessing' }
Guitar >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
