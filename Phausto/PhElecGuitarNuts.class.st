"
Bidirectional block implementing a simple electric guitar nuts. This block is based on bridgeFilter and does essentially the same thing as elecGuitarBridge, but on the other side of the chain. It also partially sets the resonance duration of the string with the bridge used on the other side.

Faust: `pm.elecGuitarNuts` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhElecGuitarNuts new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhElecGuitarNuts',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhElecGuitarNuts class >> faustName [

	^ 'elecGuitarNuts'
]
