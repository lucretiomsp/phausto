"
Abstract superclass for mono effects
"
Class {
	#name : 'PhMonoEffect',
	#superclass : 'UnitGenerator',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Effects',
	#package : 'Phausto',
	#tag : 'Effects'
}

{ #category : 'accessing' }
PhMonoEffect >> asBox [ 
 self subclassResponsibility 

]

{ #category : 'accessing' }
PhMonoEffect >> initialize [ 


super initialize .
input := 0.
]

{ #category : 'accessing' }
PhMonoEffect >> input [

	^ input
]

{ #category : 'connecting' }
PhMonoEffect >> patchedWith: aBox [
self input: aBox
]
