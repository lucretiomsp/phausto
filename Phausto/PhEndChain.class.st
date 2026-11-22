"
Closes the inputs and outputs of a bidirectional chain in all directions except for the main signal output (3d output).


"
Class {
	#name : 'PhEndChain',
	#superclass : 'PhPmFunction',
	#instVars : [
		'block'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
PhEndChain class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#block -> 'the bidirectional block (3 in / 3 out)' }
]

{ #category : 'faust' }
PhEndChain class >> argumentNames [

	^ #( #block )
]

{ #category : 'faust' }
PhEndChain class >> faustName [

	^ 'endChain'
]

{ #category : 'accessing' }
PhEndChain >> block [

	^ block
]

{ #category : 'accessing' }
PhEndChain >> block: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhEndChain >> initializeArguments [

	block := PhChain new
]
