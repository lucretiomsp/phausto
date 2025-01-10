"
Ready-to-use MIDI-enabled violin physical model with built-in UI.
"
Class {
	#name : 'ViolinMIDI',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
ViolinMIDI >> asBox [ 

^ super asBox
]

{ #category : 'initialization' }
ViolinMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.violin_ui_MIDI;'.
]
