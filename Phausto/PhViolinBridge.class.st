"
Bidirectional block implementing a simple violin bridge. This function is based on bridgeFilter.

Faust: `pm.violinBridge` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhViolinBridge new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhViolinBridge',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhViolinBridge class >> faustName [

	^ 'violinBridge'
]
