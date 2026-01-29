Class {
	#name : 'OperationsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
OperationsTest >> testPhAdderAsDsp [

	self deny: PhAdder new asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testPhDividerAsDsp [

	self deny: PhDivider new asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testPhModulorAsDsp [

	self deny: PhModulor new asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testPhMultiplicatorAsDsp [

	self deny: PhMultiplicator new asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testPhPowerAsDsp [

	self deny: PhPower new asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testPhSubtractorAsDsp [

	self deny: PhSubtractor new asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testPhZeroListAsDsp [


| zeroList |
zeroList := PhZeroList new addAll: {  SineOsc new . SquareOsc new }.
	self deny: zeroList asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testSum3UgensAsDsp [


| sum |
sum := SquareOsc new + TriOsc  new + SineOsc  new.
	self deny: sum asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testUGenMultipleParalleCompositionAsDsp [

	| composite |
	composite := SquareOsc new , SineOsc new , TriOsc  new.
	self deny: composite asDsp isNull
]

{ #category : 'tests' }
OperationsTest >> testUGenSimpleParalleCompositionAsDsp [

	| composite |
	composite := SquareOsc  new , SineOsc new .
	self deny: composite asDsp isNull
]
