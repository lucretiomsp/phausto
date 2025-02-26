"
Positive LFO square wave in [0,1].

## Parameters
- **freq**: set the frequency of the Oscillator
- **amount**: set the multiplier for the Oscillator output 
- **offset**: an offset for the LFO output. 

"
Class {
	#name : 'LFOSquarePos',
	#superclass : 'LFOForModulation',
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'initialization' }
LFOSquarePos >> initialize [

	super initialize.
	processExpression := 'process = os.lf_squarewavepos;'
]
