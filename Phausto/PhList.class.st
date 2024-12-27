"
I am the Phausto implementation of a Faust list, simulated in the language using parallel composition: (1,2,3,5,7,11). The main limitation of this approach is that there is no empty list.
A valid PhList needs to have at least 2 items, otherwise converting to a PhBox will cause an error.
Consistent with Pharo's collection indexing, counting starts at index 1.
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

	(items addAll: anArrayofNumbersOrUnitGenerators).
	^ items
]

{ #category : 'converting' }
PhList >> asBox [

	| result |
	result := (items at: 1) asBox.
	items size > 1
		ifTrue: [ 2 to: items size do: [ :i | result := result , i asBox ] ]
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
