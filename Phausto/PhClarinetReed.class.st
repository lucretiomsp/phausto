"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhClarinetReed',
	#superclass : 'PhPmFunction',
	#instVars : [
		'stiffness'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhClarinetReed class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#stiffness -> 'reed stiffness (0-1)' }
]

{ #category : 'faust' }
PhClarinetReed class >> argumentNames [

	^ #( #stiffness )
]

{ #category : 'faust' }
PhClarinetReed class >> faustName [

	^ 'clarinetReed'
]

{ #category : 'accessing' }
PhClarinetReed >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhClarinetReed >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'initialization' }
PhClarinetReed >> initializeArguments [

	stiffness := PhHSlider new
			label: self label , 'Stiffness'
			values: #( 0.5 0 1 0.01 ).
	input := PhBlower new
]

{ #category : 'accessing' }
PhClarinetReed >> stiffness [

	^ stiffness
]

{ #category : 'accessing' }
PhClarinetReed >> stiffness: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
