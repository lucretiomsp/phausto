"
A string segment without terminations (just a simple waveguide).

## Parameters:
**maxLength:** the maximum length of the string in meters (constant)
**length:** the length of the string in meters
"
Class {
	#name : 'PhStringSegment',
	#superclass : 'UnitGenerator',
	#instVars : [
		'maxLength',
		'length',
		'inputBlock'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhStringSegment >> asBox [

	^ self inputBlock asBox , self length asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhStringSegment >> initialize [

	super initialize.
	processExpression := 'process = pm.stringSegment(1.0);'.
	inputBlock := PhBasicBlock new.
		length := PhSlider new
		          label: 'StringLength'
		          values: #( 0.8 0.01 2 0.01 ).
]

{ #category : 'accessing' }
PhStringSegment >> inputBlock [ 

^ inputBlock 
]

{ #category : 'accessing' }
PhStringSegment >> length [ 

^ length
]

{ #category : 'accessing' }
PhStringSegment >> maxLength [ 
^ maxLength 
]

{ #category : 'accessing' }
PhStringSegment >> maxLength: aNumber [

	| peStream |
	maxLength := aNumber.
	peStream := ReadWriteStream on: ''.
	peStream << 'process = pm.stringSegment('.
	self maxLength printOn: peStream.
	peStream << ');'.
	processExpression := peStream contents
]
