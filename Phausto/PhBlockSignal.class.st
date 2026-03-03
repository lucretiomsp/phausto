"
Block - terminate N signals. 
"
Class {
	#name : 'PhBlockSignal',
	#superclass : 'UnitGenerator',
	#category : 'Phausto-Signals',
	#package : 'Phausto',
	#tag : 'Signals'
}

{ #category : 'instance creation' }
PhBlockSignal class >> new: anInteger [

	| n |
	n := anInteger asString.
	^ self new processExpression: 'process = si.block(' , n , ');'
]

{ #category : 'instance creation' }
PhBlockSignal >> new: anInteger [

	^ self class new: anInteger
]
