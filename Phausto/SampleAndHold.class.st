"
I am a Sample And Hold. I ""record"" the input when trig is 1, output a frozen value when trig is 0.
"
Class {
	#name : 'SampleAndHold',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trig',
		'input'
	],
	#category : 'Phausto-BoxAPI-Basics',
	#package : 'Phausto',
	#tag : 'BoxAPI-Basics'
}

{ #category : 'converting' }
SampleAndHold >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self trig  asBox, self input asBox connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'initialization' }
SampleAndHold >> initialize [

	super initialize.
	self processExpression: 'process =  ba.sAndH;'.
	self trig: 0.
	self input: 0.
]

{ #category : 'accessing' }
SampleAndHold >> input [

	^ input
]

{ #category : 'accessing' }
SampleAndHold >> input: anInput [

	input := anInput asBox
]

{ #category : 'accessing' }
SampleAndHold >> trig [

	^ trig
]

{ #category : 'accessing' }
SampleAndHold >> trig: aTrigger [

	trig := aTrigger asBox
]
