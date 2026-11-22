"
A tube segment without terminations (same as stringSegment).
##Parameters:
**maxLength:** the maximum length of the tube in meters (should be static)
**length:** the length of the tube in meters
"
Class {
	#name : 'PhOpenTube',
	#superclass : 'PhTube',
	#instVars : [
		'maxLength',
		'length'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhOpenTube class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#maxLength -> 'the maximum length of the tube in meters (should be static)'.
			#length -> 'the length of the tube in meters' }
]

{ #category : 'faust' }
PhOpenTube class >> argumentNames [

	^ #( #maxLength #length )
]

{ #category : 'faust' }
PhOpenTube class >> faustName [

	^ 'openTube'
]

{ #category : 'initialization' }
PhOpenTube >> initializeArguments [

	maxLength := 1.1.
	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.5 0.01 1.1 0.01 )
]

{ #category : 'accessing' }
PhOpenTube >> length [

	^ length
]

{ #category : 'accessing' }
PhOpenTube >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhOpenTube >> maxLength [

	^ maxLength
]

{ #category : 'accessing' }
PhOpenTube >> maxLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
