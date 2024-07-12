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
	#category : 'Phausto-BoxAPI-Basics',
	#package : 'Phausto',
	#tag : 'BoxAPI-Basics'
}

{ #category : 'converting' }
CountUp >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	
	finalBox := max , trig  connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
CountUp >> initialize [

	super initialize.
	processExpression := 'process = ba.countup;'.
"max is 10 seconds at 44100 Hz sample rate"
	self max: 441000.
	self trig: 0 asBox
]

{ #category : 'accessing' }
CountUp >> max [

	^ max
]

{ #category : 'accessing' }
CountUp >> max: anInteger [

	max := anInteger asBox
]

{ #category : 'accessing' }
CountUp >> trig [

	^ trig
]

{ #category : 'accessing' }
CountUp >> trig: aTrigger [

	trig := aTrigger asBox
]
