"
Ready-to-use MIDI-enabled electric guitar physical model with built-in UI.
"
Class {
	#name : 'ElecGuitarMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'initialization' }
ElecGuitarMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.elecGuitar_ui_MIDI;'
]
