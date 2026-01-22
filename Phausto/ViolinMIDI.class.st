"
Ready-to-use MIDI-enabled violin physical model with built-in UI.
"
Class {
	#name : 'ViolinMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'initialization' }
ViolinMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.violin_ui_MIDI;'.
]
