"
Superclass for mono demos
"
Class {
	#name : 'PhDemosMono',
	#superclass : 'PhDemos',
	#instVars : [
		'input'
	],
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}

{ #category : 'converting' }
PhDemosMono >> asBox [ 

^ self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhDemosMono >> initialize [

	super initialize.
	input := 0 
]

{ #category : 'accessing' }
PhDemosMono >> input [

^ input 
]

{ #category : 'connecting' }
PhDemosMono >> patchedWith: aUnitGenerator [

self input: aUnitGenerator 
]
