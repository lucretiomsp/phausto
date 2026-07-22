"
Abstract superclass for mono effects
"
Class {
	#name : 'PhMonoEffect',
	#superclass : 'UnitGenerator',
	#traits : 'PhInputSetter',
	#classTraits : 'PhInputSetter classTrait',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
PhMonoEffect >> asBox [ 

^ self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhMonoEffect >> initialize [

	super initialize.
	numberOfInputs := 1.
	input := Wire new
]

{ #category : 'accessing' }
PhMonoEffect >> input [

	^ input
]

{ #category : 'connecting' }
PhMonoEffect >> patchedWith: aBox [
self input: aBox
]
