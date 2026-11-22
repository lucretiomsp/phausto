"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhReedTable',
	#superclass : 'PhPmFunction',
	#instVars : [
		'offset',
		'slope'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhReedTable class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#offset -> 'table offset'.
			#slope -> 'table slope' }
]

{ #category : 'faust' }
PhReedTable class >> argumentNames [

	^ #( #offset #slope )
]

{ #category : 'faust' }
PhReedTable class >> faustName [

	^ 'reedTable'
]

{ #category : 'accessing' }
PhReedTable >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhReedTable >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'initialization' }
PhReedTable >> initializeArguments [

	offset := PhHSlider new
			label: self label , 'Offset'
			values: #( 0.7 0 1 0.01 ).
	slope := PhHSlider new
			label: self label , 'Slope'
			values: #( -0.3 -1 1 0.01 ).
	input := PhBlower new
]

{ #category : 'accessing' }
PhReedTable >> offset [

	^ offset
]

{ #category : 'accessing' }
PhReedTable >> offset: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhReedTable >> slope [

	^ slope
]

{ #category : 'accessing' }
PhReedTable >> slope: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
