"
Creates a termination on the right side of a chain without closing the inputs and outputs of the bidirectional signals chain. This function adds a 1 sample delay near the termination and can be nested within another chain.

Faust: `pm.rTermination(b, c)` (3 in / 3 out)

## Parameters

- **block**: the bidirectional block (3 in / 3 out)
- **termination**: the reflection function of the termination (1 in / 1 out), e.g. '*(-1)'

## Example

```language=Pharo
(PhLStringRigidTermination new => PhRTermination new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhRTermination',
	#superclass : 'PhPmElement',
	#instVars : [
		'block',
		'termination'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
PhRTermination class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#block -> 'the bidirectional block (3 in / 3 out)'.
			#termination -> 'the reflection function of the termination (1 in / 1 out), e.g. ''*(-1)''' }
]

{ #category : 'faust' }
PhRTermination class >> argumentNames [

	^ #( #block #termination )
]

{ #category : 'faust' }
PhRTermination class >> faustName [

	^ 'rTermination'
]

{ #category : 'accessing' }
PhRTermination >> block [

	^ block
]

{ #category : 'accessing' }
PhRTermination >> block: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhRTermination >> initializeArguments [

	block := PhBasicBlock new.
	termination := '*(-1)'
]

{ #category : 'accessing' }
PhRTermination >> termination [

	^ termination
]

{ #category : 'accessing' }
PhRTermination >> termination: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
