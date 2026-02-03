"
Hardsyncing phasor to be used with a rdtable.

##Parameters

**tablesize: the table size
**freq:** the frequency in Hz
**reset:** a reset signal, reset phase to 0 when equal to 1
**phase:** phase between 0 and 1.
"
Class {
	#name : 'HspPhasor',
	#superclass : 'HsPhasor',
	#instVars : [
		'phase'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
HspPhasor >> asBox [ 

^ self freq asBox , self reset asBox , self phase asBox connectTo: self code asBox.
]

{ #category : 'class initialization' }
HspPhasor >> initialize [

	super initialize.
	phase := (self label , 'Phase') asSymbol asPhHSlider.
	processExpression := 'process = os.hsp_phasor(1024);'
]

{ #category : 'accessing' }
HspPhasor >> phase [ 
^ phase
]
