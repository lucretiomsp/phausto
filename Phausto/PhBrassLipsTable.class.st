"
Extremely basic reed table that can be used to implement a wide range of single reed types for many different instruments (saxophone, clarinet, etc.).
##Parameters:

**excitation:** an excitation signal
**offset:** table offset
**slope:** table slope

"
Class {
	#name : 'PhBrassLipsTable',
	#superclass : 'PhPmFunction',
	#instVars : [
		'tubeLength',
		'lipsTension'
	],
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhBrassLipsTable class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#tubeLength -> 'length in meters of the tube connected to the mouthpiece'.
			#lipsTension -> 'tension of the lips (0-1) (default: 0.5)' }
]

{ #category : 'faust' }
PhBrassLipsTable class >> argumentNames [

	^ #( #tubeLength #lipsTension )
]

{ #category : 'faust' }
PhBrassLipsTable class >> faustName [

	^ 'brassLipsTable'
]

{ #category : 'accessing' }
PhBrassLipsTable >> excitation [

	"the excitation is the input signal of this function"

	^ input
]

{ #category : 'accessing' }
PhBrassLipsTable >> excitation: aUnitGenerator [

	self input: aUnitGenerator
]

{ #category : 'initialization' }
PhBrassLipsTable >> initializeArguments [

	tubeLength := PhHSlider new
			label: self label , 'TubeLength'
			values: #( 0.5 0.01 2.5 0.01 ).
	lipsTension := PhHSlider new
			label: self label , 'LipsTension'
			values: #( 0.5 0 1 0.01 ).
	input := PhBlower new
]

{ #category : 'accessing' }
PhBrassLipsTable >> lipsTension [

	^ lipsTension
]

{ #category : 'accessing' }
PhBrassLipsTable >> lipsTension: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhBrassLipsTable >> tubeLength [

	^ tubeLength
]

{ #category : 'accessing' }
PhBrassLipsTable >> tubeLength: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
