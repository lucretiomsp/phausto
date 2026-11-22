"
Bidirectional block implementing a simple electric guitar bridge. This block is based on bridgeFilter. The bridge doesn't implement transmittance since it is not meant to be connected to a body (unlike acoustic guitar). It also partially sets the resonance duration of the string with the nuts used on the other side.

Faust: `pm.elecGuitarBridge` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhElecGuitarBridge new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhElecGuitarBridge',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhElecGuitarBridge class >> faustName [

	^ 'elecGuitarBridge'
]
