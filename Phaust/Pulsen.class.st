"
Pulses (generator of length n generated at period p.
"
Class {
	#name : #Pulsen,
	#superclass : #UnitGenerators,
	#instVars : [
		'length',
		'period'
	],
	#category : #'Phaust-BoxAPI-Basics'
}

{ #category : #converting }
Pulsen >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	finalBox := length , period connectTo: intermediateBox .
	^ finalBox
]

{ #category : #initialization }
Pulsen >> initialize [

	super initialize.
	processExpression := 'process = ba.pulsen;'.
	self length: 441.
	self period: 44100
]

{ #category : #accessing }
Pulsen >> length [

	^ length
]

{ #category : #accessing }
Pulsen >> length: anObject [

	length := anObject asBox 
]

{ #category : #accessing }
Pulsen >> period [

	^ period
]

{ #category : #accessing }
Pulsen >> period: anObject [

	period := anObject asBox
]
