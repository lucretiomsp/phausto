"
I am the Phausto implementation of a Faust list, simulated in the language using parallel composition: (1,2,3,5,7,11). The main limitation of this approach in Faust is that there is no empty list.
A valid PhList needs to have at least 2 items, otherwise converting to a PhBox will cause an error.
Consistent with Pharo's collection indexing, counting starts at index 1, this means the first element of a PhList is always ""0 asBox""
"
Class {
	#name : 'PhList',
	#superclass : 'UnitGenerator',
	#instVars : [
		'items'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'adding' }
PhList >> addAll: anArrayofNumbersOrUnitGenerators [

	items addAll: anArrayofNumbersOrUnitGenerators.

]

{ #category : 'converting' }
PhList >> asBox [

	| result |
	result := (self items at: 1) asBox.
	self items size > 1
		ifTrue: [ items allButFirstDo: [ :i | result := result , i asBox ] ]
		ifFalse: [
			^ Error new signal: 'B
	Valid PhList needs at least 2 items' ].
	^ result
]

{ #category : 'initialization' }
PhList >> initialize [

	super initialize.
	items := #(0) asOrderedCollection .
]

{ #category : 'accessing' }
PhList >> items [

^ items
]
