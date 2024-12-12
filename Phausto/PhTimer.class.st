"
A simple timer that counts every samples from the beginning of the process. time is a standard Faust function.
"
Class {
	#name : 'PhTimer',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trig'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'initialization' }
PhTimer >> initialize [

	super initialize.
	processExpression := 'process = ba.timer;'
]
