"
Length in meters to frequency.
"
Class {
	#name : 'PhL2f',
	#superclass : 'PhPmFunction',
	#instVars : [
		'length'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhL2f class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'length/distance in meters' }
]

{ #category : 'faust' }
PhL2f class >> argumentNames [

	^ #( #length )
]

{ #category : 'faust' }
PhL2f class >> faustName [

	^ 'l2f'
]

{ #category : 'initialization' }
PhL2f >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 3 0.01 )
]

{ #category : 'accessing' }
PhL2f >> length [

	^ length
]

{ #category : 'accessing' }
PhL2f >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'connecting' }
PhL2f >> patchedWith: aUnitGenerator [

	self length: aUnitGenerator
]
