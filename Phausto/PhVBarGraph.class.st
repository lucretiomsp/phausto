"
The vbargraph primitive implements a vertical bar-graph (typically a meter displaying the level of a signal).
"
Class {
	#name : #PhVBarGraph,
	#superclass : #UIPrimitive,
	#instVars : [
		'input'
	],
	#category : #'Phausto-BoxAPI-UIPrimitives'
}

{ #category : #converting }
PhVBarGraph >> asBox [

	| intermediateBox finalBox intcode |
	BoxAPI uniqueInstance createLibContext.
	"sliderBox := BoxAPI uniqueInstance
		             boxVBarGraphAux: self label
		             min: self min
		             max: self max
		             input: self input asBox."
	intcode := 'import("stdfaust.lib"); process = vbargraph("' , self label , '", -1 , 1);'.
	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: intcode
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.
	finalBox := self input connectTo: intermediateBox.
	^ finalBox
]

{ #category : #initialization }
PhVBarGraph >> initialize [ 
super initialize .
self input: 1
]

{ #category : #accessing }
PhVBarGraph >> input [

	^ input
]

{ #category : #accessing }
PhVBarGraph >> input: anInput [ 

	input := anInput asBox
]
