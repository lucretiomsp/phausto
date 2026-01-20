"
Adds a signal to left and right going waves anywhere in a chain of blocks.
"
Class {
	#name : 'InLeftRightWave',
	#superclass : 'PhPmElement',
	#instVars : [
		'signal'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
InLeftRightWave >> asBox [

	^ self inputBlock asBox , self signal asBox connectTo: super asBox
]

{ #category : 'initialization' }
InLeftRightWave >> initialize [

	super initialize.
	processExpression := 'process = pm.inRightWave;'.
	signal := 0.25
]

{ #category : 'converting' }
InLeftRightWave >> signal [ 

^ signal
]
