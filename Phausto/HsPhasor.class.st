"
Hardsyncing phasor to be used with a rdtable.

##Parameters

**tablesize: the table size
**freq:** the frequency in Hz
**reset:** a reset signal, reset phase to 0 when equal to 1
"
Class {
	#name : 'HsPhasor',
	#superclass : 'Phasor',
	#instVars : [
		'reset'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
HsPhasor >> asBox [

	^ self freq asBox , self reset asBox connectTo: self code asBox
]

{ #category : 'accessing' }
HsPhasor >> freq [ 
^ freq
]

{ #category : 'initialization' }
HsPhasor >> initialize [

	super initialize.

	reset := PhButton new label: self label , 'Reset'.
	processExpression := 'process = os.hs_phasor(1024);'
]

{ #category : 'accessing' }
HsPhasor >> reset [ 
^ reset
]
