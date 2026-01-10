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
		'prePost',
		'link'
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
	input := 0.
	inputL := 0.
	inputR := 0.
	ratio := PhHSlider new label: 'CompressorRatio' values: #( 4 1 10 0.1 ).
	threshold := PhHSlider new label: 'CompressorThreshold' values: #( -6 -60 0 0.1 ).
	attack := PhHSlider new label: 'CompressorAttack' values: #( 0.001 0.0001 0.3 0.0001 ).
	release := PhHSlider new label: 'CompressorRelease' values: #( 0.001 0.0001 0.3 0.0001 ).

	strength := PhHSlider new label: 'Strength' values: #( 0.5 0 1 0.01 ).
	knee := PhHSlider new label: 'Knee' values: #( 6 1 10 0.01 ). "level detector is at the input"
	prePost := 0. "channels are linked by default"
	link := 1
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
