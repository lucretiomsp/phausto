"
Starts counting down pulses. While trig is 1 the output is counting up, while trig is 0 the counter is reset to 0.

Parameter:
trig: the trigger signal (1: start at next pulse; 0: reset to 0)

"
Class {
	#name : 'PulseCountDown',
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
PulseCountDown >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self trig connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PulseCountDown >> initialize [

	super initialize.
	processExpression := 'process = ba.pulse_countdown;'
]

{ #category : 'accessing' }
PulseCountDown >> trig [

	^ trig ifNil: [
		  trig := PhButton new label: self label , 'Gate' ]
]
