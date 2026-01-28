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

{ #category : 'connecting' }
PhBasics >> patchedWith: aUnitGenerator [

	self input: aUnitGenerator
]
