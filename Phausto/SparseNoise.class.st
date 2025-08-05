"
Sparse noise generator. Random impulses in the amplitude range -1 to 1 are generated at an average rate of _frequency_ impulses per second.


##Parameter
**frequency:** average frequency of noise impulses per second


"
Class {
	#name : 'SparseNoise',
	#superclass : 'Noise',
	#instVars : [
		'frequency'
	],
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
}

{ #category : 'initialization' }
SparseNoise >> initialize [

	super initialize.
	frequency := 1.
	processExpression := 'process = no.sparse_noise;'
]
