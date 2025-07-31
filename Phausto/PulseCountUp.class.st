"
Starts counting up pulses. While trig is 1 the output is counting up, while trig is 0 the counter is reset to 0.

Parameter:
trig: the trigger signal (1: start at next pulse; 0: reset to 0)

"
Class {
	#name : 'PulseCountUp',
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
PulseCountUp >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.


	finalBox := self trig connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PulseCountUp >> initialize [

	super initialize.
	processExpression := 'process = ba.pulse_countup;'
]

{ #category : 'accessing' }
PulseCountUp >> trig [

	^ trig ifNil: [
		  trig := PhButton new label: self label , 'Gate' ]
]
