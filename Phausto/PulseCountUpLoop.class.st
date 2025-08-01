"
Starts counting up pulses from 0 to n included. While trig is 1 the output is counting down, while trig is 0 the counter is reset to 0. At the end of the countdown (n) the output value will be reset to 0.

Parameter:
n: the highest number of the countup (included) before reset to 0
trig: the trigger signal (1: start at next pulse; 0: reset to 0)

"
Class {
	#name : 'PulseCountUpLoop',
	#superclass : 'UnitGenerator',
	#instVars : [
		'max',
		'trig',
		'n',
		'input'
	],
	#category : 'Phausto-Basics - Counters/TimeTools',
	#package : 'Phausto',
	#tag : 'Basics - Counters/TimeTools'
}

{ #category : 'converting' }
PulseCountUpLoop >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self n , self trig , self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PulseCountUpLoop >> initialize [

	super initialize.
	processExpression := 'process = ba.pulse_countup_loop;'
]

{ #category : 'as yet unclassified' }
PulseCountUpLoop >> input [

	^ input ifNil: [
		  input := PhHSlider new
			           label: self label , 'Input'
			           init: 5000
			           min: 20
			           max: 18000
			           step: 1 ]
]

{ #category : 'as yet unclassified' }
PulseCountUpLoop >> n [

	^ n ifNil: [
		  n := PhHSlider new
			       label: self label , 'N'
			       init: 1
			       min: 1
			       max: 256
			       step: 1 ]
]

{ #category : 'accessing' }
PulseCountUpLoop >> trig [

	^ trig ifNil: [
		  trig := PhButton new label: self label , 'Gate' ]
]
