"
Ready-to-use MIDI-enabled violin physical model with built-in UI.
"
Class {
	#name : 'ViolinMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
ViolinMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.violin_ui_MIDI;'.
]
