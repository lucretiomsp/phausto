Class {
	#name : 'PhQuantize',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input',
		'rootFrequency',
		'noteList'
	],
	#category : 'Phausto-Quantizers',
	#package : 'Phausto',
	#tag : 'Quantizers'
}

{ #category : 'converting' }
PhQuantize >> asBox [

	^ self input asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhQuantize >> initialize [

	super initialize.
	processExpression := 'process = qu.quantize(440 , (1.125 , 1.25 , 1.333 ,  1.5));'.
	input := 440.
	rootFrequency := 440.
	noteList := #( 1.125 1.25 1.333 1.5 ) asPhList
]

{ #category : 'accessing' }
PhQuantize >> input [ 
^ input
]

{ #category : 'accessing' }
PhQuantize >> noteList [

	^ noteList
]

{ #category : 'accessing' }
PhQuantize >> rootFrequency [

	^ rootFrequency
]
