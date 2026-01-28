"
This UnitGenerator makes the work of the downSample standard Faust function.  Down sample a signal. WARNING: this function doesn't change the rate of a signal, it just holds samples...
Deafult frequency of 1000 Hz
"
Class {
	#name : 'PhDownSampler',
	#superclass : 'PhBasics',
	#instVars : [
		'frequency'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhDownSampler >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self frequency asBox   ,  self input asBox  connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
PhDownSampler >> frequency [

	^ frequency 
]

{ #category : 'initialization' }
PhDownSampler >> initialize [

	super initialize.
	processExpression := 'process = ba.downSample;'.
	frequency := PhHSlider new
		             label: self label , 'Frequency'
		             init: 300
		             min: 20
		             max: 18000
		             step: 1.
   input := Wire new.
]

{ #category : 'connecting' }
PhDownSampler >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]
