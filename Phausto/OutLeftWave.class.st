"
Adds a signal to left going waves anywhere in a chain of blocks.
"
Class {
	#name : 'OutLeftWave',
	#superclass : 'PhPmOutElement',
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
OutLeftWave >> asBox [

	^ self outputBlock asBox connectTo: super asBox
]

{ #category : 'initialization' }
OutLeftWave >> initialize [

	super initialize.
	processExpression := 'process = pm.outLeftWave;'.

]
