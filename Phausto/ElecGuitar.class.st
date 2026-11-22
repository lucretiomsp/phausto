"
A simple acoustic guitar model with steel strings (based on guitarModel) implementing an excitation model. This model implements a single string. Additional strings should be created by making a polyphonic application out of this function.
"
Class {
	#name : 'ElecGuitar',
	#superclass : 'StringInstruments',
	#instVars : [
		'freq',
		'pluckPosition',
		'mute',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
ElecGuitar class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#freq -> 'the frequency in Hz'.
			#pluckPosition -> 'pluck position (0-1) (1 is on the bridge)'.
			#mute -> 'mute coefficient (1 for no mute and 0 for instant mute)'.
			#gain -> 'gain of the pluck (0-1)'.
			#trigger -> 'trigger signal (1 for on, 0 for off)' }
]

{ #category : 'faust' }
ElecGuitar class >> argumentNames [

	^ #( #freq #pluckPosition #mute #gain #trigger )
]

{ #category : 'faust' }
ElecGuitar class >> faustName [

	^ 'elecGuitar'
]

{ #category : 'faust' }
ElecGuitar >> faustArguments [

	"the Faust function wants the length of the string: my frequency is converted with pm.f2l"

	| arguments |
	arguments := super faustArguments copy.
	arguments at: 1 put: 'pm.f2l(' , freq asFaustArgument , ')'.
	^ arguments
]

{ #category : 'accessing' }
ElecGuitar >> freq [

	^ freq
]

{ #category : 'accessing' }
ElecGuitar >> freq: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
ElecGuitar >> gain [

	^ gain
]

{ #category : 'accessing' }
ElecGuitar >> gain: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
ElecGuitar >> initializeArguments [

	freq := PhHSlider new
			label: self label , 'Freq'
			values: #( 440 20 1200 1 ).
	pluckPosition := PhHSlider new
			label: self label , 'PluckPosition'
			values: #( 0.8 0.01 0.99 0.01 ).
	mute := 1.
	gain := PhHSlider new
			label: self label , 'Gain'
			values: #( 0.5 0 1 0.001 ).
	trigger := PhButton new label: self label , 'Trigger'
]

{ #category : 'accessing' }
ElecGuitar >> mute [

	^ mute
]

{ #category : 'accessing' }
ElecGuitar >> mute: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
ElecGuitar >> pluckPosition [

	^ pluckPosition
]

{ #category : 'accessing' }
ElecGuitar >> pluckPosition: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
ElecGuitar >> trigger [

	^ trigger
]

{ #category : 'accessing' }
ElecGuitar >> trigger: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
