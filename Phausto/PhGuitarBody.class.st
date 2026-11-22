"
WARNING: not implemented yet! Bidirectional block implementing a simple acoustic guitar body.

Faust: `pm.guitarBody` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhGuitarBody new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhGuitarBody',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhGuitarBody class >> faustName [

	^ 'guitarBody'
]
