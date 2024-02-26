"
Super class of all Unit Generators
"
Class {
	#name : #UnitGenerators,
	#superclass : #Box,
	#instVars : [
		'importStatement',
		'code'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
UnitGenerators >> asBox [

	| box |
	BoxAPI uniqueInstance createLibContext .
	box := BoxAPI uniqueInstance
		       boxFromString: self code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.
	^ box
]

{ #category : #accessing }
UnitGenerators >> code [

	^ code
]

{ #category : #accessing }
UnitGenerators >> code: anObject [

	code := anObject
]

{ #category : #accessing }
UnitGenerators >> importStatement [

	^ importStatement
]

{ #category : #accessing }
UnitGenerators >> importStatement: anObject [

	importStatement := anObject
]

{ #category : #initialization }
UnitGenerators >> initialize [

	super initialize.
	importStatement  := 'import("stdfaust.lib");'
]
