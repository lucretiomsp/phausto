"
This UnitGenerator makes the work of the downSample standard Faust function.  Down sample a signal. WARNING: this function doesn't change the rate of a signal, it just holds samples...
Deafult frequency of 1000 Hz
"
Class {
	#name : 'DownSampler',
	#superclass : 'UnitGenerator',
	#instVars : [
		'frequency',
		'input'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
DownSampler >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self frequency  ,  self input  connectTo: intermediateBox.

	^ finalBox
]

{ #category : 'accessing' }
DownSampler >> frequency [

	^ frequency 
]

{ #category : 'initialization' }
DownSampler >> initialize [

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

{ #category : 'accessing' }
DownSampler >> input [

	^ input
]

{ #category : 'connecting' }
DownSampler >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]
