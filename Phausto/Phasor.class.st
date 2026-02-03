"
A simple phasor to be used with a rdtable. phasor is a standard Faust function.

## Parameters:

**tablesize:** the table size
**freq:** the frequency in Hz

Note that tablesize is just a multiplier for the output of a unit-amp phasor so phasor(1.0, freq) can be used to generate a phasor output in the range [0, 1]
"
Class {
	#name : 'Phasor',
	#superclass : 'WaveTableBasedOscillators',
	#instVars : [
		'freq'
	],
	#classInstVars : [
		'freq'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
Phasor >> asBox [ 

^ self freq asBox connectTo: super asBox.
]

{ #category : 'accessing' }
Phasor >> freq [ 
^ freq
]

{ #category : 'class initialization' }
Phasor >> initialize [

	super initialize.
	freq := PhHSlider new
		        label: self label , 'Freq'
		        values: #( 440 20 6000 0.1 ).
	processExpression := 'process = os.phasor(1024);'
]
