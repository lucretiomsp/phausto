"
SVF-based filter that morphs smoothly between lowpass, bandpass and highpass (fi.svf_morph).

**frequency:** cutoff frequency (Hz)
**q:** quality factor
**blend:** 0 = lowpass, 1 = bandpass, 2 = highpass
"
Class {
	#name : 'PhSvfMorph',
	#superclass : 'PhStateVariableFilter',
	#instVars : [
		'blend'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhSvfMorph >> asBox [

	^ self frequency asBox , self q asBox , self blend asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhSvfMorph >> blend [

	^ blend
]

{ #category : 'accessing' }
PhSvfMorph >> blend: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhSvfMorph >> initialize [

	super initialize.
	processExpression := 'process = fi.svf_morph;'.
	blend := PhHSlider new label: self label , 'Blend' values: #( 1 0 2 0.01 )
]
