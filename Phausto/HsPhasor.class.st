"
Hardsyncing phasor to be used with a rdtable.

##Parameters

**tablesize: the table size
**freq:** the frequency in Hz
**reset:** a reset signal, reset phase to 0 when equal to 1
"
Class {
	#name : 'HsPhasor',
	#superclass : 'WaveTableBasedOscillators',
	#instVars : [
		'reset',
		'freq'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
HsPhasor >> asBox [

	^ self freq asBox , self reset asBox connectTo: super asBox.
]

{ #category : 'accessing' }
HsPhasor >> freq [ 
^ freq
]

{ #category : 'class initialization' }
HsPhasor >> initialize [

	super initialize.
	freq := PhHSlider new
		        label: self label , 'Freq'
		        values: #( 440 20 6000 0.1 ).
	reset := PhButton new label: self label , 'Reset'.
	processExpression := 'process = os.hs_phasor(1024);'
]

{ #category : 'accessing' }
HsPhasor >> reset [ 
^ reset
]
