"
Super class of all Unit Generators.
The import statement imports all the functions of Faust Standard Libraries.
The process expression must be declared for all the different subclasses.
"
Class {
	#name : #UnitGenerators,
	#superclass : #Box,
	#instVars : [
		'importStatement',
		'processExpression',
		'code'
	],
	#category : #'Phausto-BoxAPI-Boxes'
}

{ #category : #converting }
UnitGenerators >> asBox [

	| box  |
	BoxAPI uniqueInstance createLibContext.
	box := BoxAPI uniqueInstance
		       boxFromString: self code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.
	^ box
]

{ #category : #accessing }
UnitGenerators >> code [

"code returns the import statement joined with the process expression"
	^ self importStatement , self processExpression
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
	importStatement := 'import("stdfaust.lib");'.
	processExpression := 'process = 0;'. "an empty UnitGenerator simply out zeros"
	
]

{ #category : #accessing }
UnitGenerators >> processExpression [

	^ processExpression
]

{ #category : #accessing }
UnitGenerators >> processExpression: anObject [

	processExpression := anObject
]

{ #category : #'as yet unclassified' }
UnitGenerators >> stereo [

"return a stereo version of the box (connect to Left and Right outputs)"

| mono stereo |

mono := self asBox.
stereo := mono splitTo: Wire new asBox , Wire new asBox .
^ stereo 
]
