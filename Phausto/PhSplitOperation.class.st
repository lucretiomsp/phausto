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

{ #category : 'converting' }
PhSplitOperation >> input [ 
^ input
]

{ #category : 'trait - inputs' }
PhSplitOperation >> input: aUnitGenerator [


input := aUnitGenerator 
]

{ #category : 'converting' }
PhSplitOperation >> output [ 
^ output
]

{ #category : 'trait - inputs' }
PhSplitOperation >> output: aUnitGenerator [

	output := aUnitGenerator
]
