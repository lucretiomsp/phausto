"
Wave-Table-Based Sine wave oscillator with hard syncing phase
"
Class {
	#name : 'HsOscSin',
	#superclass : 'Oscillator',
	#instVars : [
		'reset'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
HsOscSin >> asBox [ 

^ self freq asBox , self reset asBox connectTo: self code asBox 
]

{ #category : 'initialization' }
HsOscSin >> initialize [ 
super initialize . 
reset := PhButton new label: self label , 'Reset'.
processExpression := 'process = os.hs_oscsin;'
]

{ #category : 'accessing' }
HsOscSin >> reset [ 
^ reset
]
