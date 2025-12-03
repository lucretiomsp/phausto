"
Convenience superclass for stereo compressor, limiters and expanders
"
Class {
	#name : 'PhProcessorStereo',
	#superclass : 'UnitGenerator',
	#instVars : [
		'ld',
		'ceiling',
		'attack',
		'hold',
		'release',
		'input',
		'inputL',
		'inputLR'
	],
	#category : 'Phausto-Compressors',
	#package : 'Phausto',
	#tag : 'Compressors'
}

{ #category : 'initialization' }
PhProcessorStereo >> initialize [

	super initialize.
	inputL := 0 asBox.
   inputLR:= 0 asBox.
]
