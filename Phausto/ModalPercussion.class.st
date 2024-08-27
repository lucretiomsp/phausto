"
High and low level objects for modal synthesis of percussion instruments.

"
Class {
	#name : 'ModalPercussion',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq',
		'strikePosition',
		'strikeSharpness',
		'gain',
		'trigger'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'accessing' }
ModalPercussion >> freq [

	^ freq
]

{ #category : 'accessing' }
ModalPercussion >> freq: anObject [

	freq := anObject asBox
]

{ #category : 'accessing' }
ModalPercussion >> gain [

	^ gain
]

{ #category : 'accessing' }
ModalPercussion >> gain: anObject [

	gain := anObject asBox
]

{ #category : 'initialization' }
ModalPercussion >> initialize [ 
super initialize .
self freq: 440.
	self strikePosition: 3.
	self strikeSharpness: 0.8.
	self gain: 0.5.
	self trigger: 0.0
]

{ #category : 'initialization' }
ModalPercussion >> initializeFreqAsSlider [
	"default value of 440 Hz, A4 - max value is 4096 i.e. C8"

	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 440
		        min: 20
		        max: 4086
		        step: 1
]

{ #category : 'initialization' }
ModalPercussion >> initializeStrikePosAsSlider [
	"default value of 440 Hz, A4 - max value is 4096 i.e. C8"

	freq := PhHSlider new
		        label: self label , 'StrikePosition'
		        init: 1
		        min: 0
		        max: 5
		        step: 0.01
]

{ #category : 'initialization' }
ModalPercussion >> initializeStrikeSharpAsSlider [
	"default value of 440 Hz, A4 - max value is 4096 i.e. C8"

	freq := PhHSlider new
		        label: self label , 'StrikeSharpness'
		        init: 0.3
		        min: 0.01
		        max: 1
		        step: 0.01
]

{ #category : 'initialization' }
ModalPercussion >> initializeUIParameters [

	super initializeUIParameters.
	"default frequency for all Oscilators is A4 at picth standard - maxValue corresponds to a C8 note"

	"the UI element to control the freq is created only if the parameter is nil at instance creation"
	freq ifNil: [ self initializeFreqAsSlider ]
]

{ #category : 'accessing' }
ModalPercussion >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
ModalPercussion >> strikePosition: anObject [

	strikePosition := anObject asBox
]

{ #category : 'accessing' }
ModalPercussion >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
ModalPercussion >> strikeSharpness: anObject [

	strikeSharpness := anObject asBox
]

{ #category : 'accessing' }
ModalPercussion >> trigger [

	^ trigger
]

{ #category : 'accessing' }
ModalPercussion >> trigger: anObject [

	trigger := anObject asBox
]
