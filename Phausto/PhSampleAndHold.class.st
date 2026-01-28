"
I am a Sample And Hold. I ""record"" the input when trig is 1, output a frozen value when trig is 0.
"
Class {
	#name : 'PhSampleAndHold',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trig',
		'input'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhSampleAndHold >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self trig  asBox, self input asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
PhSampleAndHold >> initialize [

	super initialize.
	self processExpression: 'process =  ba.sAndH;'.
	trig := 0.
	input := 0.
]

{ #category : 'accessing' }
PhSampleAndHold >> input [

	^ input
]

{ #category : 'accessing' }
PhSampleAndHold >> trig [

	^ trig
]
