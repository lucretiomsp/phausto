"
Ready-to-use MIDI compliant clarinet physical model with built-in UI.


"
Class {
	#name : 'ClarinetMIDI',
	#superclass : 'WindInstruments',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
ClarinetMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.clarinet_ui_MIDI;'
]
