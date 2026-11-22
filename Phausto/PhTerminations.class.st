"
Creates terminations on both sides of a chain without closing the inputs and outputs of the bidirectional signals chain. As for chain, this function adds a 1 sample delay to the bidirectional signal, both ways. Of course, this function can be nested within a chain.
"
Class {
	#name : 'PhTerminations',
	#superclass : 'PhPmElement',
	#instVars : [
		'leftTermination',
		'block',
		'rightTermination'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
PhTerminations class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#leftTermination -> 'the reflection function of the left termination (1 in / 1 out), e.g. ''*(-1)'''.
			#block -> 'the bidirectional block (3 in / 3 out)'.
			#rightTermination -> 'the reflection function of the right termination (1 in / 1 out), e.g. ''*(-1)''' }
]

{ #category : 'faust' }
PhTerminations class >> argumentNames [

	^ #( #leftTermination #block #rightTermination )
]

{ #category : 'faust' }
PhTerminations class >> faustName [

	^ 'terminations'
]

{ #category : 'accessing' }
PhTerminations >> block [

	^ block
]

{ #category : 'accessing' }
PhTerminations >> block: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhTerminations >> initializeArguments [

	leftTermination := '*(-1)'.
	block := PhBasicBlock new.
	rightTermination := '*(-1)'
]

{ #category : 'accessing' }
PhTerminations >> leftTermination [

	^ leftTermination
]

{ #category : 'accessing' }
PhTerminations >> leftTermination: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTerminations >> rightTermination [

	^ rightTermination
]

{ #category : 'accessing' }
PhTerminations >> rightTermination: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
