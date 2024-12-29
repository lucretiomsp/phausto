"
The vbargraph primitive implements a vertical bar-graph (typically a meter displaying the level of a signal).
"
Class {
	#name : 'PhVBarGraph',
	#superclass : 'UIPrimitive',
	#instVars : [
		'input'
	],
	#classInstVars : [
		'aNumber'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'converting' }
PhVBarGraph >> asBox [

	| intermediateBox finalBox intcode |
	BoxAPI uniqueInstance createLibContext.
	"sliderBox := BoxAPI uniqueInstance
		             boxVBarGraphAux: self label
		             min: self min
		             max: self max
		             input: self input asBox."
	intcode := 'import("stdfaust.lib"); process = vbargraph("'
	           , self label , '", ' , self min asString , ','
	           , self max asString , ');'.

	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: intcode
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.
	finalBox := self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'converting' }
PhVBarGraph >> asBox2 [

	| intermediateBox finalBox intcode |
	BoxAPI uniqueInstance createLibContext.
	"sliderBox := BoxAPI uniqueInstance
		             boxVBarGraphAux: self label
		             min: self min
		             max: self max
		             input: self input asBox."
	intcode := 'import("stdfaust.lib"); process = vbargraph("'
	           , self label , '", ' , self min asString , ','
	           , self max asString , ');'.
	intcode traceCr.
	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: intcode
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.
	finalBox := self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
PhVBarGraph >> initialize [

	super initialize.
	self input: 1.
	min := -1.
	max := 1
]

{ #category : 'accessing' }
PhVBarGraph >> input [

	^ input
]

{ #category : 'accessing' }
PhVBarGraph >> input: anInput [ 

	input := anInput asBox
]

{ #category : 'accessing' }
PhVBarGraph >> max: aNumber [

	max := aNumber 
]

{ #category : 'accessing' }
PhVBarGraph >> min [ 
^ min
]

{ #category : 'accessing' }
PhVBarGraph >> min: aNumber [

	min := aNumber 
]

{ #category : 'connecting' }
PhVBarGraph >> patchedWith: aUnitGenerator [

self input: aUnitGenerator 
]
