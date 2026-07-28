"
**Resonant bandpass filter** that can be used to implement a single resonance (_mode_).


"
Class {
	#name : 'PhModeFilter',
	#superclass : 'UnitGenerator',
	#traits : 'PhFrequencySetter',
	#classTraits : 'PhFrequencySetter classTrait',
	#instVars : [
		'freq',
		't60',
		'gain',
		'input'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
PhModeFilter >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self freq asBox , self t60 asBox , self gain asBox , self input asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
PhModeFilter >> freq [

	^ freq
]

{ #category : 'accessing' }
PhModeFilter >> gain [

	^ gain
]

{ #category : 'accessing' }
PhModeFilter >> gain: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhModeFilter >> initialize [

	super initialize.
	processExpression := 'process = pm.modeFilter;'.
	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 440
		        min: 20
		        max: 5000
		        step: 0.001.
	gain := PhHSlider new
		        label: self label , 'Gain'
		        init: 0.5
		        min: 0
		        max: 1
		        step: 0.001.
	t60 := PhHSlider new
		       label: self label , 'T60'
		       init: 0.5
		       min: 0
		       max: 3
		       step: 0.001.
	input := Pulse new period: 0.1
]

{ #category : 'accessing' }
PhModeFilter >> input [

	^ input
]

{ #category : 'accessing' }
PhModeFilter >> input: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'connecting' }
PhModeFilter >> patchedWith: aUnitGenerator [

self input: aUnitGenerator 
]

{ #category : 'accessing' }
PhModeFilter >> t60 [

	^ t60
]

{ #category : 'accessing' }
PhModeFilter >> t60: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
