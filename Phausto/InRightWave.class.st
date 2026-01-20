"
Adds a signal to right going waves anywhere in a chain of blocks.
"
Class {
	#name : 'InRightWave',
	#superclass : 'PhPmElement',
	#instVars : [
		'signal'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
InRightWave >> asBox [

	^ self inputBlock asBox , self signal asBox connectTo: super asBox
]

{ #category : 'initialization' }
InRightWave >> initialize [

	super initialize.
	processExpression := 'process = pm.in;'.
	signal := 0.25
]

{ #category : 'converting' }
InRightWave >> signal [ 

^ signal
]
