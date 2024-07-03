"
This UnitGenerator makes the work of the downSample standard Faust function.  Down sample a signal. WARNING: this function doesn't change the rate of a signal, it just holds samples...
Deafult frequency of 1000 Hz
"
Class {
	#name : #DownSampler,
	#superclass : #UnitGenerator,
	#instVars : [
		'frequency',
		'input'
	],
	#category : #'Phausto-BoxAPI-Basics'
}

{ #category : #converting }
DownSampler >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self frequency  ,  self input  connectTo: intermediateBox.

	^ finalBox
]

{ #category : #accessing }
DownSampler >> frequency [

	^ frequency
]

{ #category : #accessing }
DownSampler >> frequency: aFrequency [

	frequency := aFrequency asBox
]

{ #category : #initialization }
DownSampler >> initialize [

	super initialize.
	processExpression := 'process = ba.downSample;'.
	self frequency: 1000
]

{ #category : #accessing }
DownSampler >> input [

	^ input
]

{ #category : #accessing }
DownSampler >> input: anInput [ 

	input := anInput asBox
]
