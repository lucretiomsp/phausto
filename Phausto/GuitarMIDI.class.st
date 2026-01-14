"
Ready-to-use MIDI-enabled steel strings acoustic guitar physical model with built-in UI.
"
Class {
	#name : 'GuitarMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
GuitarMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.guitar_ui_MIDI;'
]
