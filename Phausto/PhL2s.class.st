"
Length in meters to number of samples
"
Class {
	#name : 'PhL2s',
	#superclass : 'PhPmFunction',
	#instVars : [
		'length'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhL2s class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#length -> 'length in meters' }
]

{ #category : 'faust' }
PhL2s class >> argumentNames [

	^ #( #length )
]

{ #category : 'faust' }
PhL2s class >> faustName [

	^ 'l2s'
]

{ #category : 'initialization' }
PhL2s >> initializeArguments [

	length := PhHSlider new
			label: self label , 'Length'
			values: #( 0.8 0.01 3 0.01 )
]

{ #category : 'accessing' }
PhL2s >> length [

	^ length
]

{ #category : 'accessing' }
PhL2s >> length: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'connecting' }
PhL2s >> patchedWith: aUnitGenerator [

	self length: aUnitGenerator
]
