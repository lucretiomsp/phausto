Class {
	#name : #BoxNumber,
	#superclass : #Box,
	#instVars : [
		'value'
	],
	#category : #'Phaust-Boxes'
}

{ #category : #'instance creation' }
BoxNumber class >> value: anInteger [

	^ self new
		  value: anInteger;
		  yourself
]

{ #category : #'code generation' }
BoxNumber >> faustCode [

	^ value asString
]

{ #category : #accessing }
BoxNumber >> numberOfInputs [

	^ 0
]

{ #category : #accessing }
BoxNumber >> numberOfOutputs [

	^ 1
]

{ #category : #accessing }
BoxNumber >> value: anInteger [ 
	value := anInteger
]
