"
Convenience superclass for mono compressor, limiters and expanders
"
Class {
	#name : 'PhProcessorMono',
	#superclass : 'UnitGenerator',
	#instVars : [
		'ld',
		'ceiling',
		'attack',
		'hold',
		'release',
		'input'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'initialization' }
PhProcessorMono >> initialize [ 

super initialize.
input := 0 asBox
]
