"
Adds a signal to left going waves anywhere in a chain of blocks.
"
Class {
	#name : 'InLeftWave',
	#superclass : 'PhPmElement',
	#instVars : [
		'signal'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'converting' }
InLeftWave >> asBox [

	^ self inputBlock asBox , self signal asBox connectTo: super asBox
]

{ #category : 'initialization' }
InLeftWave >> initialize [

	super initialize.
	processExpression := 'process = pm.inLeftWave;'.
	signal := 0.25
]

{ #category : 'accessing' }
InLeftWave >> signal [ 
^ signal
]
