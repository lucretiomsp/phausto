"
Ready-to-use, MIDI-enabled Karplus-Strong string with buil-in UI.
"
Class {
	#name : 'KarplusStrongMIDI',
	#superclass : 'StringInstruments',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
KarplusStrongMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.ks_ui_MIDI;'
]
