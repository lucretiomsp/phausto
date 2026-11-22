"
A string segment without terminations (just a simple waveguide).

## Parameters:
**maxLength:** the maximum length of the string in meters (constant)
**length:** the length of the string in meters
"
Class {
	#name : 'PhStringSegment',
	#superclass : 'PhPmElement',
	#instVars : [
		'maxLength',
		'length'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhStringSegment class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#maxLength -> 'the maximum length of the string in meters (should be static)'.
			#length -> 'the length of the string in meters' }
]

{ #category : 'faust' }
PhStringSegment class >> argumentNames [

	^ #( #maxLength #length )
]

{ #category : 'faust' }
PhStringSegment class >> faustName [

	^ 'stringSegment'
]

{ #category : 'initialization' }
PhStringSegment >> initializeArguments [

	maxLength := 1.0.
	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.5 0.01 1 0.01 )
]

{ #category : 'accessing' }
PhStringSegment >> length [

	^ length
]

{ #category : 'accessing' }
PhStringSegment >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhStringSegment >> maxLength [

	^ maxLength
]

{ #category : 'accessing' }
PhStringSegment >> maxLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
