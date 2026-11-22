"
Simple MIDI controllable djembe physical model with built-in UI.
"
Class {
	#name : 'MarimbaMIDI',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysModels - Modal Percussions',
	#package : 'Phausto',
	#tag : 'PhysModels - Modal Percussions'
}

{ #category : 'faust' }
MarimbaMIDI class >> faustName [

	^ 'marimba_ui_MIDI'
]
