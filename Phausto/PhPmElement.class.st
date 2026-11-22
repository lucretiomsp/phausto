"
Abstract superclass of the bidirectional blocks of physmodels.lib: 3 inputs and 3 outputs. The first input/output carry left going waves, the second right going waves and the third any output signal.
Compose them with the ChucK operator `=>` (it builds a `PhChain`, Faust pm.chain) and close the chain with `endChain`:
```language=Pharo
(PhLStringRigidTermination new => PhOpenString new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhPmElement',
	#superclass : 'PhPmFunction',
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'connecting' }
PhPmElement >> chainWith: aBidirectionalBlock [
	"a PhChain of the receiver and the block (the blocks of a chain argument are flattened in)"

	(aBidirectionalBlock isKindOf: PhChain) ifTrue: [
		^ PhChain new blocks: { self } , aBidirectionalBlock blocks asArray ].
	^ PhChain new blocks: {
			  self.
			  aBidirectionalBlock }
]
