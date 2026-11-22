"
Bidirectional block implementing simple violin nuts. This function is based on bridgeFilter.

Faust: `pm.violinNuts` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhViolinNuts new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhViolinNuts',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhViolinNuts class >> faustName [

	^ 'violinNuts'
]
