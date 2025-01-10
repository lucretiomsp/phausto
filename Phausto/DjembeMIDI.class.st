"
Simple MIDI controllable djembe physical model with built-in UI.
"
Class {
	#name : 'DjembeMIDI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'initialization' }
DjembeMIDI >> initialize [

	super initialize.

	processExpression := 'process = pm.djembe_ui_MIDI;'
]
