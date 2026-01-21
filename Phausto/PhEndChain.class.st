"
Closes the inputs and outputs of a bidirectional chain in all directions except for the main signal output (3d output).


"
Class {
	#name : 'PhEndChain',
	#superclass : 'PhPmElement',
	#instVars : [
		'outputBlock'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
PhEndChain >> asBox [ 

^ self inputBlock asBox , self outputBlock asBox 
]

{ #category : 'initialization' }
PhEndChain >> initialize [

	super initialize.

	processExpression := 'process = pm.endChain;'.
	
outputBlock := PhBasicBlock new
]

{ #category : 'accessing' }
PhEndChain >> outputBlock [ 

^ outputBlock 
]
