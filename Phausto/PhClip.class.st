"
Clip the value of the input signal between min and max
"
Class {
	#name : 'PhClip',
	#superclass : 'Saturators',
	#instVars : [
		'min',
		'max'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
PhClip >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self min  asBox, self max asBox , self input asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhClip >> initialize [

	super initialize.
	processExpression :='process = aa.clip;'.
	
	
]

{ #category : 'accessing' }
PhClip >> max [

	^ max ifNil: [   PhHSlider new
		        label: self label , 'Max'
		        init: 1
		        min: -1
		        max: 1
		        step: 0.001 ]
]

{ #category : 'accessing' }
PhClip >> max: aNumberOrABox [


	max := aNumberOrABox isNumber
		        ifTrue: [ self max init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ].

]

{ #category : 'accessing' }
PhClip >> min [

	^ min ifNil: [   PhHSlider new
		        label: self label , 'Min'
		        init: -1
		        min: -1
		        max: 1
		        step: 0.001 ]
]

{ #category : 'accessing' }
PhClip >> min: aNumberOrABox [


	min := aNumberOrABox isNumber
		        ifTrue: [ self min init: aNumberOrABox ]
		        ifFalse: [ aNumberOrABox ].

]
