"
Simple flute foot implementing waves reflexion and dispersion.

Faust: `pm.fluteFoot` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhFluteFoot new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhFluteFoot',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - Wind Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - Wind Instruments'
}

{ #category : 'faust' }
PhFluteFoot class >> faustName [

	^ 'fluteFoot'
]
