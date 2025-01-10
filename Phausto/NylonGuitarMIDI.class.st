"
Ready-to-use MIDI-enabled electric guitar physical model with built-in UI.
"
Class {
	#name : 'NylonGuitarMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
NylonGuitarMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.nylonGuitar_ui_MIDI;'
]
