"
Bidirectional block implementing the interaction of a bow in a chain.

Faust: `pm.bowInteraction(b)` (3 in / 3 out)

## Parameters

- **bowTable**: the bow table

## Example

```language=Pharo
(PhLStringRigidTermination new => PhBowInteraction new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhBowInteraction',
	#superclass : 'PhPmElement',
	#instVars : [
		'bowTable'
	],
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhBowInteraction class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#bowTable -> 'the bow table' }
]

{ #category : 'faust' }
PhBowInteraction class >> argumentNames [

	^ #( #bowTable )
]

{ #category : 'faust' }
PhBowInteraction class >> faustName [

	^ 'bowInteraction'
]

{ #category : 'accessing' }
PhBowInteraction >> bowTable [

	^ bowTable
]

{ #category : 'accessing' }
PhBowInteraction >> bowTable: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhBowInteraction >> initializeArguments [

	bowTable := '(+ : (0.5 - _) <: *(pm.violinBowTable(0.5)) <: _,_)'
]
