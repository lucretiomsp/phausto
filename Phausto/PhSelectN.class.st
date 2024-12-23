"
Select inputs at index
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
	size := anArrayOfNumbersOrUNitGenerators size asString.
	"super initialize."
	^ self new list: anArrayOfNumbersOrUNitGenerators;   processExpression: 'ba.selectn(' , size asString , ');' 
]

{ #category : 'converting' }
PhSelectN >> asBox [

	| intermediateBox phList finalBox |
	phList := self list asPhList asBox.

	intermediateBox := super asBox.
	
	finalBox := self index asBox , phList connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
PhSelectN >> index [


	^ index ifNil: [
		  index := PhHSlider new
			          label: self label , 'Index'
			          init: 0
			          min: 0
			          max: 1
			          step: 1 ]
]

{ #category : 'initialization' }
PhSelectN >> initialize [

	super initialize.
	processExpression := 'process = ba.selectn (5);'
]

{ #category : 'accessing' }
PhSelectN >> list [ 

^ list
]

{ #category : 'accessing' }
PhSelectN >> list: anArrayOfNumbersOrUnitGenerators [

	| size |
	list := anArrayOfNumbersOrUnitGenerators.


	size := anArrayOfNumbersOrUnitGenerators size asString.

	processExpression := 'process = ba.selectn(' , size asString , ');'
]

{ #category : 'instance creation' }
PhSelectN >> new: anArrayOfNumbersOrUNitGenerators [

	
	^ self class new: anArrayOfNumbersOrUNitGenerators
]
