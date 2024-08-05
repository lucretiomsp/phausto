"
High and low level objects for modal synthesis of percussion instruments.

"
Class {
	#name : #ModalPercussion,
	#superclass : #UnitGenerator,
	#instVars : [
		'freq',
		'strikePosition',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : #'Phausto-PhysicalModels'
}

{ #category : #accessing }
ModalPercussion >> freq [

	^ freq
]

{ #category : #accessing }
ModalPercussion >> freq1 [

	^ freq
]

{ #category : #accessing }
ModalPercussion >> freq1: anObject [

	freq := anObject
]

{ #category : #accessing }
ModalPercussion >> freq: anObject [

	freq := anObject asBox
]

{ #category : #accessing }
ModalPercussion >> gain [

	^ gain
]

{ #category : #accessing }
ModalPercussion >> gain: anObject [

	gain := anObject asBox
]

{ #category : #initialization }
ModalPercussion >> initialize [ 
super initialize .
self freq: 440.
	self strikePosition: 3.
	self strikeSharpness: 0.8.
	self gain: 0.5.
	self trigger: 0.0
]

{ #category : #accessing }
ModalPercussion >> strikePosition [

	^ strikePosition
]

{ #category : #accessing }
ModalPercussion >> strikePosition: anObject [

	strikePosition := anObject asBox
]

{ #category : #accessing }
ModalPercussion >> strikeSharpness [

	^ strikeSharpness
]

{ #category : #accessing }
ModalPercussion >> strikeSharpness: anObject [

	strikeSharpness := anObject asBox
]

{ #category : #accessing }
ModalPercussion >> trigger [

	^ trigger
]

{ #category : #accessing }
ModalPercussion >> trigger: anObject [

	trigger := anObject asBox
]
