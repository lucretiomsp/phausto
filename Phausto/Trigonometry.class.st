"
Collection of trigonomertric UnitGenerators at audio rate
"
Class {
	#name : 'Trigonometry',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Antialiased',
	#package : 'Phausto',
	#tag : 'Antialiased'
}

{ #category : 'converting' }
Trigonometry >> asBox [


	^  self input asBox  connectTo: self code asBox .

]

{ #category : 'initialization' }
Trigonometry >> initialize [

	| faustFunctionName |

super initialize .
	faustFunctionName := (self class name findBetweenSubstrings: ' ')
		                     first asLowercase.
	super initialize.
	input := 1 .
	processExpression := 'process = aa.' , faustFunctionName , ';'
]

{ #category : 'accessing' }
Trigonometry >> input [

	^ input 
]

{ #category : 'connecting' }
Trigonometry >> input: aUnitGenerator [

	input := aUnitGenerator 
]

{ #category : 'connecting' }
Trigonometry >> patchedWith: aPhBox [

self input: aPhBox
]
