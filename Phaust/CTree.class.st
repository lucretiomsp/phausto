"
CTree class, used as a container for Boxes
"
Class {
	#name : #CTree,
	#superclass : #FFIOpaqueObject,
	#instVars : [
		'errorBuffer',
		'inputs',
		'outputs'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #accessing }
CTree >> errorBuffer [

	^ errorBuffer
]

{ #category : #accessing }
CTree >> errorBuffer: anObject [

	errorBuffer := anObject
]

{ #category : #initialization }
CTree >> initialize [

	| intPtr |
	intPtr := FFIExternalValueHolder ofType: 'int'.

	self inputs: (intPtr new value: 0).
	self outputs: intPtr new value: 0
]

{ #category : #accessing }
CTree >> inputs [

	^ inputs
]

{ #category : #accessing }
CTree >> inputs: anObject [

	inputs := anObject
]

{ #category : #accessing }
CTree >> outputs [

	^ outputs
]

{ #category : #accessing }
CTree >> outputs: anObject [

	outputs := anObject
]
