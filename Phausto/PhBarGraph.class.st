"
I am the super class for the horizontal and vertical bargraphs 
"
Class {
	#name : 'PhBarGraph',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input',
		'min',
		'max'
	],
	#category : 'Phausto-UIPrimitives',
	#package : 'Phausto',
	#tag : 'UIPrimitives'
}

{ #category : 'initialization' }
PhBarGraph >> initialize [ 

super initialize.
	label := self className. 
	input := 1 .
	min := -1.
	max := 1
]

{ #category : 'accessing' }
PhBarGraph >> input [

	^ input
]

{ #category : 'accessing' }
PhBarGraph >> input: anInput [

	input := anInput 
]

{ #category : 'accessing' }
PhBarGraph >> label [

	^ label
]

{ #category : 'accessing' }
PhBarGraph >> label: aString [

	label := aString 
]

{ #category : 'accessing' }
PhBarGraph >> max [

	^ max
]

{ #category : 'accessing' }
PhBarGraph >> max: aMax [

	max := aMax
]

{ #category : 'accessing' }
PhBarGraph >> min [ 
^ min
]

{ #category : 'accessing' }
PhBarGraph >> min: aMin [

	min := aMin
]

{ #category : 'connecting' }
PhBarGraph >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]
