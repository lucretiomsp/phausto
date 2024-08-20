"
Dirt-simple djembe modal physical model. Mode parameters are empirically calculated and don't correspond to any measurements or 3D model. They kind of sound good though :).

This model also implements a virtual ""exciter"".
"
Class {
	#name : 'Djembe',
	#superclass : 'ModalPercussion',
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
Djembe >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	finalBox := freq , strikePosition , strikeSharpness , gain, trigger
		            connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
Djembe >> freq [

	^ freq
]

{ #category : 'accessing' }
Djembe >> freq: anObject [
	"sets the fundamental frequency of the model"

	freq := anObject asBox
]

{ #category : 'accessing' }
Djembe >> gain [

	^ gain
]

{ #category : 'accessing' }
Djembe >> gain: anObject [
	" gain of the strike"

	gain := anObject asBox
]

{ #category : 'initialization' }
Djembe >> initialize [

	super initialize.
	processExpression := 'process = pm.djembe;'.
	self freq: (PhHSlider new
			 label: self label , 'Freq'
			 init: 440
			 min: 20
			 max: 1200
			 step: 1).
	self strikePosition: (PhHSlider new
			 label: self label ,'StrikePos'
			 init: 0.5
			 min: 0
			 max: 1
			 step: 0.001).
	self strikeSharpness: (PhHSlider new
			 label: self label,  'StrikeSharp'
			 init: 0.5
			 min: 0
			 max: 1
			 step: 0.001).
	self gain: 0.5.
	self trigger: (PhHSlider new
			 label:  self label ,'Gate'
			 init: 0
			 min: 0
			 max: 1
			 step: 1)
]

{ #category : 'accessing' }
Djembe >> strikePosition [

	^ strikePosition
]

{ #category : 'accessing' }
Djembe >> strikePosition: anObject [
	"strike position (0 for the middle of the membrane and 1 for the edge)"

	strikePosition := anObject asBox
]

{ #category : 'accessing' }
Djembe >> strikeSharpness [

	^ strikeSharpness
]

{ #category : 'accessing' }
Djembe >> strikeSharpness: anObject [
	" sharpness of the strike (0-1)"

	strikeSharpness := anObject asBox
]

{ #category : 'accessing' }
Djembe >> trigger [

	^ trigger
]

{ #category : 'accessing' }
Djembe >> trigger: anObject [
	"trigger signal (0: off, 1: on)"

	trigger := anObject asBox.
]
