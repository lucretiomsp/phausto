"
Convenience superclass for all lookahead limiters.
A lookahead limiter delays the audio signal by a few milliseconds while simultaneously analyzing a non-delayed copy. This allows the limiter to detect upcoming peaks in advance and apply gain reduction exactly in time, avoiding distortion and clipping

"
Class {
	#name : 'PhLookaheadLimiter',
	#superclass : 'PhCompressor',
	#instVars : [
		'n',
		'ld',
		'ceiling'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'accessing' }
PhLookaheadLimiter >> ceiling [ 
^ ceiling 
]

{ #category : 'accessing' }
PhLookaheadLimiter >> hold [ 
 ^ hold
]

{ #category : 'initialization' }
PhLookaheadLimiter >> initialize [

	super initialize.
	n := 2.
	ld := 0.1.
	ceiling := PhHSlider new
		           label: 'LimiterCeiling'
		           values: #( 1 0 1 0.01 ).
	hold := PhHSlider new label: 'LimiterHold' values: #( 0.2 0 2 0.01 ).
	attack := PhHSlider new
		          label: 'LimiterAttack'
		          values: #( 0.001 0.0001 0.3 0.0001 ).
	release := PhHSlider new
		           label: 'LimiterRelease'
		           values: #( 0.001 0.0001 0.3 0.0001 )
]

{ #category : 'accessing' }
PhLookaheadLimiter >> ld [ 
^ ld
]

{ #category : 'accessing' }
PhLookaheadLimiter >> n [ 

^ n
]
