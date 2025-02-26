"
Alias-suppressed sawtooth oscillator, sawtooth is a standard Faust function.

## Parameters:

- **freq**: frequency in Hz
"
Class {
	#name : 'SawOsc',
	#superclass : 'Oscillator',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
SawOsc >> asBox [

	| intermediateBox finalBox |

	intermediateBox := super asBox.
	finalBox := self freq asBox connectTo: intermediateBox.
	^ finalBox * self uLevel
]

{ #category : 'initialization' }
SawOsc >> initialize [

	super initialize.
	processExpression := 'process = os.sawtooth;'
]
