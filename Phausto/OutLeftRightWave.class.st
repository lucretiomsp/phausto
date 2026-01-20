"
Sends the signal of right and left going waves to the output channel of the chain.
"
Class {
	#name : 'OutLeftRightWave',
	#superclass : 'PhPmOutElement',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
OutLeftRightWave >> asBox [

	^ self outputBlock asBox connectTo: super asBox
]

{ #category : 'initialization' }
OutLeftRightWave >> initialize [

	super initialize.
	processExpression := 'process = pm.out;'
]
