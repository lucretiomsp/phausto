"
Conveniece abstract super class for basics utilities with one input
"
Class {
	#name : 'PhBasics',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'accessing' }
PhBasics >> initialize [

super initialize .
input := 0
]

{ #category : 'accessing' }
PhBasics >> input [ 
^ input 
]

{ #category : 'connecting' }
PhBasics >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]
