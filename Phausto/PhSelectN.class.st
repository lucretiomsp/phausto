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
PhSelectN class >> new: anArrayOfNumbersOrUnitGenerators [

	| size |
	size := (anArrayOfNumbersOrUnitGenerators size + 1) asString.
	"super initialize."
	^ self new
		  list: anArrayOfNumbersOrUnitGenerators asPhList;
		  processExpression: 'process = ba.selectn(' , size asString , ');'
]

{ #category : 'converting' }
PhSelectN >> asBox [

	| intermediateBox phList finalBox indexBox |
	phList := self list  .
	indexBox := self index .
	intermediateBox := super asBox.

	finalBox := indexBox  , phList connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
PhSelectN >> index [

	^ index 
]

{ #category : 'initialization' }
PhSelectN >> initialize [

	super initialize.
	processExpression := 'process = ba.selectn(5);'.
	index := PhHSlider new
		         label: self label , 'Index'
		         init: 0
		         min: 0
		         max: 3
		         step: 1.
	list := {
		        0.1 asBox.
		        0.2 asBox.
		        0.3 asBox.
		        0.4 asBox } asPhList
]

{ #category : 'accessing' }
PhSelectN >> list [

	^ list 
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
