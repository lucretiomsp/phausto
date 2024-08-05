"
A simple generic flute instrument physical model without tone holes (pitch is changed by changing the length of the tube of the instrument).

Where:

tubeLength: the length of the tube in meters
mouthPosition: position of the mouth on the embouchure (0-1) (default: 0.5)
pressure: the pressure of the air flow created by the virtual performer (0-1). This can also be any kind of signal that will directly injected in the mouthpiece (e.g., breath noise, etc.).
"
Class {
	#name : #FluteModel,
	#superclass : #UnitGenerator,
	#instVars : [
		'tubeLength',
		'mouthPosition',
		'pressure'
	],
	#category : #'Phausto-PhysicalModels'
}

{ #category : #initialization }
FluteModel >> initializeUIParameters [

	super initializeUIParameters.

	tubeLength := PhHSlider new
		              label: self label , 'TubeLength'
		              init: 0.1
		              min: 0.01
		              max: 2
		              step: 0.01.
	mouthPosition := PhHSlider new
		                 label: self label , 'MouthPosition'
		                 init: 0.5
		                 min: 0.1
		                 max: 1
		                 step: 0.01.
		pressure := PhHSlider new
		              label: self label , 'Pressure'
		              init: 0.1
		              min: 0
		              max: 1
		              step: 0.01
]

{ #category : #accessing }
FluteModel >> mouthPosition [

	^ mouthPosition
]

{ #category : #accessing }
FluteModel >> mouthPosition: 	aNumberOrABox [ 
	aNumberOrABox isNumber
		ifTrue: [
			mouthPosition  := PhHSlider new
				        label: self label , 'MoutPosition'
				        init: aNumberOrABox
				        min: 20
				        max: 4086
				        step: 1 ]
		ifFalse: [ mouthPosition  := aNumberOrABox ]
]

{ #category : #accessing }
FluteModel >> pressure [

	^ pressure
]

{ #category : #accessing }
FluteModel >> pressure: anObject [

	pressure := anObject
]

{ #category : #accessing }
FluteModel >> tubeLength [

	^ tubeLength
]

{ #category : #accessing }
FluteModel >> tubeLength: anObject [

	tubeLength := anObject
]
