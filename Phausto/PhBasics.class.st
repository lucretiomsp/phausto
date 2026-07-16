"
Conveniece abstract super class for basics utilities with one input
"
Class {
	#name : 'PhBasics',
	#superclass : 'UnitGenerator',
	#traits : 'PhInputSetter',
	#classTraits : 'PhInputSetter classTrait',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'initialization' }
PhBasics >> initialize [

super initialize .
input := Wire new.
]

{ #category : 'accessing' }
PhBasics >> input [ 
^ input 
]

{ #category : 'connecting' }
PhBasics >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]
