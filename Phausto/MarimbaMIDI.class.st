"
Simple MIDI controllable djembe physical model with built-in UI.
"
Class {
	#name : 'MarimbaMIDI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
MarimbaMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.marimba_ui_MIDI;'
]
