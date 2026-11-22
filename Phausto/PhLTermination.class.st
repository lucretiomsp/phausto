"
Creates a termination on the left side of a chain without closing the inputs and outputs of the bidirectional signals chain. This function adds a 1 sample delay near the termination and can be nested within another chain.

Faust: `pm.lTermination(a, b)` (3 in / 3 out)

## Parameters

- **termination**: the reflection function of the termination (1 in / 1 out), e.g. '*(-1)'
- **block**: the bidirectional block (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhLTermination new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhLTermination',
	#superclass : 'PhPmElement',
	#instVars : [
		'termination',
		'block'
	],
	#category : 'Phausto-PhysModels - BiDir Utilities',
	#package : 'Phausto',
	#tag : 'PhysModels - BiDir Utilities'
}

{ #category : 'faust' }
PhLTermination class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#termination -> 'the reflection function of the termination (1 in / 1 out), e.g. ''*(-1)'''.
			#block -> 'the bidirectional block (3 in / 3 out)' }
]

{ #category : 'faust' }
PhLTermination class >> argumentNames [

	^ #( #termination #block )
]

{ #category : 'faust' }
PhLTermination class >> faustName [

	^ 'lTermination'
]

{ #category : 'accessing' }
PhLTermination >> block [

	^ block
]

{ #category : 'accessing' }
PhLTermination >> block: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhLTermination >> initializeArguments [

	termination := '*(-1)'.
	block := PhBasicBlock new
]

{ #category : 'accessing' }
PhLTermination >> termination [

	^ termination
]

{ #category : 'accessing' }
PhLTermination >> termination: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
