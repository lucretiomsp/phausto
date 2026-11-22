"
Simple flute head implementing waves reflexion.

Faust: `pm.fluteHead` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhFluteHead new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhFluteHead',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhFluteHead class >> faustName [

	^ 'fluteHead'
]
