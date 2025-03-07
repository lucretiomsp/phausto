"
**Resonant bandpass filter** that can be used to implement a single resonance (_mode_).


"
Class {
	#name : 'ModeFilter',
	#superclass : 'UnitGenerator',
	#instVars : [
		'freq',
		't60',
		'gain',
		'input'
	],
	#category : 'Phausto-PhysicalModels',
	#package : 'Phausto',
	#tag : 'PhysicalModels'
}

{ #category : 'converting' }
ModeFilter >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self t60 asBox , self gain asBox , self input asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
ModeFilter >> freq [

	^ freq
]

{ #category : 'accessing' }
ModeFilter >> gain [

	^ gain
]

{ #category : 'initialization' }
ModeFilter >> initialize [

	super initialize.
	processExpression := 'process = pm.modeFilter;'.
	gain := 0.5.
	freq := 440.
	t60 := 0.3.
	input := Pulse new period: 0.1.
	
]

{ #category : 'accessing' }
ModeFilter >> input [

	^ input
]

{ #category : 'accessing' }
ModeFilter >> t60 [

	^ t60
]
