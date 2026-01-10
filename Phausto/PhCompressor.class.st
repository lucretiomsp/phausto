"
Convenience superclass for Compressors and Limiters
More about compressors on [Wikipedia](http://en.wikipedia.org/wiki/Dynamic_range_compression) and on [Julius Smith III wewbpage](https://ccrma.stanford.edu/~jos/filters/Nonlinear_Filter_Example_Dynamic.html)
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
		'inputR',
		'strength',
		'knee',
		'prePost'
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
	threshold := PhHSlider new label: 'CompressorThreshold' values: #( -6 -60 0 0.1 ).
	attack := PhHSlider new label: 'CompressorAttack' values: #( 0.001 0.0001 0.3 0.0001 ).
	release := PhHSlider new label: 'CompressorRelease' values: #( 0.001 0.0001 0.3 0.0001 )
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
PhCompressor >> knee [ 
^ knee
]

{ #category : 'accessing' }
PhCompressor >> lad [

	^ lad
]

{ #category : 'accessing' }
PhCompressor >> prePost [ 

^ prePost
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
PhCompressor >> strength [ 

^ strength
]

{ #category : 'accessing' }
PhCompressor >> threshold [  
^ threshold
]
