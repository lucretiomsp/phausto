"
Simple MIDI controllable djembe physical model with built-in UI.
"
Class {
	#name : 'DjembeMIDI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
DjembeMIDI class >> faustName [

	^ 'djembe_ui_MIDI'
]
