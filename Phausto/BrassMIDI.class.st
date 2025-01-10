"
Ready-to-use MIDI-controllable brass instrument physical model with built-in UI.
"
Class {
	#name : 'BrassMIDI',
	#superclass : 'WindInstruments',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
BrassMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.brass_ui_MIDI;'
]
