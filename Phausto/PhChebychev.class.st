Class {
	#name : 'PhChebychev',
	#superclass : 'UnitGenerator',
	#instVars : [
		'order',
		'input'
	],
	#category : 'Phausto-Math',
	#package : 'Phausto',
	#tag : 'Math'
}

{ #category : 'converting' }
PhChebychev >> asBox [

	processExpression := 'process =.chebychev(' , self order asString
	                     , ');'.
	^ self input connectTo: super asBox 
]

{ #category : 'initialization' }
PhChebychev >> initialize [

	super initialize.

	processExpression := 'process = ma.chebychev(2);'.
	order := 2
]

{ #category : 'accessing' }
PhChebychev >> input [

	^ input 
]

{ #category : 'accessing' }
PhChebychev >> order [

^ order
]

{ #category : 'accessing' }
PhChebychev >> order: anInteger [


order := anInteger 
]
