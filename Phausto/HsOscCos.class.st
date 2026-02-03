"
Wave-Table-Based Sine wave oscillator with hard syncing phase
"
Class {
	#name : 'HsOscCos',
	#superclass : 'Oscillator',
	#instVars : [
		'reset'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
HsOscCos >> asBox [ 

^ self freq asBox , self reset asBox connectTo: self code asBox 
]

{ #category : 'initialization' }
HsOscCos >> initialize [

	super initialize.
	reset := PhButton new label: self label , 'Reset'.
	processExpression := 'process = os.hs_osccos;'
]

{ #category : 'accessing' }
HsOscCos >> reset [ 
^ reset
]
