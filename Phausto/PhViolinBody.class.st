"
Bidirectional block implementing a simple violin body (just a simple resonant lowpass filter).

Faust: `pm.violinBody` (3 in / 3 out)

## Example

```language=Pharo
(PhLStringRigidTermination new => PhViolinBody new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhViolinBody',
	#superclass : 'PhPmElement',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'faust' }
PhViolinBody class >> faustName [

	^ 'violinBody'
]
