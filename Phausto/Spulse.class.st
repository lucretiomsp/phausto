"
Produces a single pulse of n samples when trig goes from 0 to 1.

Parameter:
n: pulse length as a number of samples
trig: the trigger signal (1: start the pulse)
"
Class {
	#name : 'Spulse',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trig',
		'n',
		'input'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
Spulse >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self n , self trig connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
Spulse >> initialize [

	super initialize.
	processExpression := 'process = ba.spulse;'
]

{ #category : 'as yet unclassified' }
Spulse >> n [

	^ n ifNil: [
		  n := PhHSlider new
			            label: self label , 'N'
			            init: 1
			            min: 1
			            max: 88200
			            step: 1 ]
]

{ #category : 'as yet unclassified' }
Spulse >> trig [

	^ trig ifNil: [ trig := PhButton new label: self label , 'Gate' ]
]
