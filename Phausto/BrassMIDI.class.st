"
Ready-to-use MIDI-controllable brass instrument physical model with built-in UI.
"
Class {
	#name : 'BrassMIDI',
	#superclass : 'WindInstruments',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
BrassMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.brass_ui_MIDI;'
]
