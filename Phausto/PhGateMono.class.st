"
Mono signal gate.

## Parameters: 
**thresh: dB level threshold above which gate opens (e.g., -60 dB)
**att:** attack time = time constant (sec) for gate to open (e.g., 0.0001 s = 0.1 ms)
**hold:** hold time = time (sec) gate stays open after signal level < thresh (e.g., 0.1 s)
**rel:** release time = time constant (sec) for gate to close (e.g., 0.020 s = 20 ms)

"
Class {
	#name : 'PhGateMono',
	#superclass : 'PhCompressor',
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'converting' }
PhGateMono >> asBox [


	 ^ (self input asBox , self threshold asBox , self attack asBox
, self hold asBox , self release asBox connectTo: super asBox)
]

{ #category : 'accessing' }
PhGateMono >> hold [ 
^ hold 
]

{ #category : 'initialization' }
PhGateMono >> initialize [

	super initialize.
	processExpression := 'process = ef.gate_mono;'.
	threshold := PhHSlider new
		             label: 'GateThreshold'
		             values: #( -6 -60 0 0.1 ).
	attack := PhHSlider new
		          label: 'GateAttack'
		          values: #( 0.001 0.0001 0.3 0.0001 ).
	release := PhHSlider new
		           label: 'GateRelease'
		           values: #( 0.001 0.0001 0.3 0.0001 ).
	hold := PhHSlider new label: 'GateHold' values: #( 0.1 0 2 0.001 )
]
