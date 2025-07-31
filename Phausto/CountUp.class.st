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
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
CountUp >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self max asBox  , self trig asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
CountUp >> initialize [

	super initialize.
	processExpression := 'process = ba.countup;'.
	max := PhHSlider new
		       label: self label , 'Max'
		       init: 1
		       min: 1
		       max: 64
		       step: 1.
	trig := PhButton new label: self label , 'Gate'
]

{ #category : 'as yet unclassified' }
CountUp >> max [

	^ max 
]

{ #category : 'accessing' }
CountUp >> trig [

	^ trig 
]
