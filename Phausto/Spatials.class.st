"
Subclasse of Spatials are tools for sound spatialization. 
"
Class {
	#name : 'Spatials',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pan',
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
Spatials >> input [

	^ input ifNil:  [ input := Wire new ]
]

{ #category : 'accessing' }
Spatials >> input: aPhBox [

	input := aPhBox
]

{ #category : 'accessing' }
Spatials >> pan [

	^ pan ifNil: [
		  PhHSlider new
			  label: self label , 'Pan'
			  init: 0.5
			  min: 0
			  max: 1
			  step: 0.001 ]
]

{ #category : 'accessing' }
Spatials >> pan: anObject [

	pan := anObject
]
