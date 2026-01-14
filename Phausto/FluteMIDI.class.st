"
Ready-to-use MIDI-controllable flute physical model with built-in UI.
"
Class {
	#name : 'FluteMIDI',
	#superclass : 'WindInstruments',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
FluteMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.flute_ui_MIDI;'
]
