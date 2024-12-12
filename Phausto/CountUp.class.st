"
Starts counting up from 0 to n included. While trig is 1 the output is 0. The countup starts with the transition of trig from 1 to 0. At the end of the countup the output value will remain at n until the next trig. countup is a standard Faust function.
"
Class {
	#name : 'CountUp',
	#superclass : 'UnitGenerator',
	#instVars : [
		'max',
		'trig'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
CountUp >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	
	finalBox := self max , self  trig  connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
CountUp >> initialize [

	super initialize.
	processExpression := 'process = ba.countup;'.

]

{ #category : 'as yet unclassified' }
CountUp >> max [

	^ max  ifNil: [
		  max := PhHSlider new
			            label: self label , 'Max'
			            init: 1
			            min: 1
			            max: 64
			            step: 11 ]
]

{ #category : 'accessing' }
CountUp >> trig [

	^ trig ifNil: [
		  trig := PhButton new label: self label , 'Gate' ]
]
