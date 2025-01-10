"
Ready-to-use MIDI-controllable flute physical model with built-in UI.
"
Class {
	#name : 'FluteMIDI',
	#superclass : 'WindInstruments',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
FluteMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.flute_ui_MIDI;'
]
