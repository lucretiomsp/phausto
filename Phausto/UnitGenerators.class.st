"
Super class of all Unit Generators.
The import statement imports all the functions of Faust Standard Libraries.
The process expression must be declared for all the different subclasses.
The uLevel instance variable is used to set the level of the UGen and it acts as a Gain multiplier.
Each Unit Geneterator has a label, by default is the class name; the label is used to construct the UI/control access to the Unit Generator
"
Class {
	#name : #UnitGenerators,
	#superclass : #PhBox,
	#instVars : [
		'importStatement',
		'processExpression',
		'code',
		'uLevel',
		'label'
	],
	#category : #'Phausto-UnitGenerators'
}

{ #category : #converting }
UnitGenerators >> asBox [

	| box |
	BoxAPI uniqueInstance createLibContext.
	box := BoxAPI uniqueInstance
		       boxFromString: self code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.
	^ box * self uLevel 
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
	self uLevel: 1
]

{ #category : #accessing }
UnitGenerators >> label [

	^ label
]

{ #category : #accessing }
UnitGenerators >> label: aString [

	label := aString
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

{ #category : #accessing }
UnitGenerators >> uLevel [

	^ uLevel
]

{ #category : #accessing }
UnitGenerators >> uLevel: aLevel [

	uLevel := aLevel asBox
]
