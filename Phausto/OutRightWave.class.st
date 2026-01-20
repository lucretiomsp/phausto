"
Sends the signal of right going waves to the output channel of the chain.


"
Class {
	#name : 'OutRightWave',
	#superclass : 'PhPmOutElement',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
OutRightWave >> asBox [

	^ self outputBlock asBox connectTo: super asBox
]

{ #category : 'initialization' }
OutRightWave >> initialize [

	super initialize.
	processExpression := 'process = pm.outRightWave;'
]
