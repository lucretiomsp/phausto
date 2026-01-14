"
Simple MIDI controllable djembe physical model with built-in UI.
"
Class {
	#name : 'DjembeMIDI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
DjembeMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.djembe_ui_MIDI;'
]
