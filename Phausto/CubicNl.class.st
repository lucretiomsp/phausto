"
Cubic Non Linearity Distortion

Parameter:
drive: distortion amount, between 0 and 1
offset: constant added before nonlinearity to give even harmonics. Note: offset can introduce a nonzero mean - feed cubicnl output to dcblocker to remove this.
References:
https://ccrma.stanford.edu/~jos/pasp/Cubic_Soft_Clipper.html
https://ccrma.stanford.edu/~jos/pasp/Nonlinear_Distortion.html
"
Class {
	#name : 'CubicNl',
	#superclass : 'UnitGenerator',
	#instVars : [
		'level',
		'input',
		'fr',
		'wah',
		'drive',
		'offset'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'converting' }
CubicNl >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := self drive asBox , self offset asBox, self input asBox connectTo:
		            intermediateBox.
	^ finalBox
]

{ #category : 'as yet unclassified' }
CubicNl >> drive [

	^ drive 
]

{ #category : 'initialization' }
CubicNl >> initialize [

	super initialize.
	processExpression := 'process = ef.cubicnl;'.
	  drive := PhHSlider new
			         label: self class name , 'Drive'
			         init: 0.03
			         min: 0
			         max: 1
			         step: 0.001 .
			
		offset := PhHSlider new
			           label: self class name , 'Offset'
			           init: 0.81
			           min: 0
			           max: 1
			           step: 0.001 .
			
		input := 0 asBox 
]

{ #category : 'accessing' }
CubicNl >> input [

	^ input 
]

{ #category : 'as yet unclassified' }
CubicNl >> offset [

	^ offset 
]

{ #category : 'as yet unclassified' }
CubicNl >> patchedWith: aBox [
self input: aBox
]
