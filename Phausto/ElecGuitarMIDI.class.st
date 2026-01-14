"
Ready-to-use MIDI-enabled electric guitar physical model with built-in UI.
"
Class {
	#name : 'ElecGuitarMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
ElecGuitarMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.elecGuitar_ui_MIDI;'
]
