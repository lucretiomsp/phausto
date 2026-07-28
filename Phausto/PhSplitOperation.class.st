"
Convenience class to split Unit Generators before converting them into PhBoxes
"
Class {
	#name : 'PhSplitOperation',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input',
		'output'
	],
	#category : 'Phausto-Operations',
	#package : 'Phausto',
	#tag : 'Operations'
}

{ #category : 'converting' }
PhSplitOperation >> asBox [ 

^ self input asBox splitTo: self output asBox
]

{ #category : 'initialization' }
PhSplitOperation >> initialize [

	super initialize.
	input := Noise new.
	output := ZitaLight new.
]

{ #category : 'accessing' }
PhSplitOperation >> input [ 
^ input
]

{ #category : 'accessing' }
PhSplitOperation >> input: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhSplitOperation >> output [ 
^ output
]

{ #category : 'accessing' }
PhSplitOperation >> output: aUnitGenerator [

	output := aUnitGenerator
]
