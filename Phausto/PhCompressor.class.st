"
Convenience superclass for Compressors and Limiters

## Parameters
**lad:** is the lookahead delay in seconds, known at compile-time
**ceiling:** dB level threshold above which compression kicks in (0 dB = max level)
**attack:** is the attack time in seconds

**release:** is the release time in seconds
"
Class {
	#name : 'PhCompressor',
	#superclass : 'UnitGenerator',
	#instVars : [
		'lad',
		'ratio',
		'threshold',
		'attack',
		'hold',
		'release',
		'input',
		'inputL',
		'inputR'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'accessing' }
PhCompressor >> attack [ 
^ attack
]

{ #category : 'initialization' }
PhCompressor >> initialize [ 

super initialize.
ratio := 4.
threshold := -9.
attack := 0.01.
release := 0.2
]

{ #category : 'accessing' }
PhCompressor >> input [


^ input
]

{ #category : 'accessing' }
PhCompressor >> inputL [


^ inputL
]

{ #category : 'accessing' }
PhCompressor >> inputR [


^ inputR
]

{ #category : 'accessing' }
PhCompressor >> ratio [ 

^ ratio
]

{ #category : 'accessing' }
PhCompressor >> release [ 

^ release
]

{ #category : 'accessing' }
PhCompressor >> threshold [  
^ threshold
]
