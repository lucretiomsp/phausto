"
Select inputs at index.
PhSelectN starts counting from 1 coherently with Pharo indexing.
This is a trick as Fuast selectN start counting from 0. actually PhSelect index 0 will return silence.
To create a PhSelectN with n number of inputs.
```language=Pharo
selector := PhSelectN new: aNumberOfInputs
``` 
or
```language=Pharo
selector := PhSelectN new list: aPhList
```

"
Class {
	#name : 'PhSelectN',
	#superclass : 'UnitGenerator',
	#instVars : [
		'list',
		'index'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'instance creation' }
PhSelectN class >> new: anArrayOfNumbersOrUNitGenerators [

	| size |
	size := (anArrayOfNumbersOrUNitGenerators size + 1) asString.
	"super initialize."
	^ self new
		  list: anArrayOfNumbersOrUNitGenerators;
		  processExpression: 'process = ba.selectn(' , size asString , ');'
]

{ #category : 'converting' }
PhSelectN >> asBox [

	| intermediateBox phList finalBox indexBox |
	phList := self list asBox.
   indexBox := self index asBox.
	intermediateBox := super asBox.

	finalBox :=  indexBox , phList connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
PhSelectN >> index [

	^ index 
]

{ #category : 'initialization' }
PhSelectN >> initialize [

	super initialize.
	processExpression := 'process = ba.selectn (5);'.
	index := PhHSlider new
			           label: self label , 'Index'
			           init: 1
			           min: 1
			           max: 8
			           step: 1
]

{ #category : 'accessing' }
PhSelectN >> list [

	^ list asPhList 
]

{ #category : 'accessing' }
PhSelectN >> list: anArrayOfNumbersOrUnitGenerators [

	| size |
	list := anArrayOfNumbersOrUnitGenerators.


	size := (anArrayOfNumbersOrUnitGenerators size + 1) asString.

	processExpression := 'process = ba.selectn(' , size asString , ');'
]

{ #category : 'instance creation' }
PhSelectN >> new: anArrayOfNumbersOrUNitGenerators [

	
	^ self class new: anArrayOfNumbersOrUNitGenerators
]
