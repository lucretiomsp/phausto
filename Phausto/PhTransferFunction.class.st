"
Filters given directly by their transfer function coefficients, from the Faust filters library.
Digital ones (tf1, tf2, tf3 ...) take z-plane coefficients (a0 = 1); analog ones (tf1s, tf2s ...) take s-plane coefficients digitized with the bilinear transform.

**b0 ... b3:** numerator coefficients
**a0 ... a3:** denominator coefficients
**w1:** analog frequency (rad/s) mapped exactly by the bilinear transform
**wc:** analog center frequency (rad/s) of the band filters (tf1sb, tf2sb)

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'PhTransferFunction',
	#superclass : 'PhFilter',
	#instVars : [
		'b0',
		'b1',
		'b2',
		'b3',
		'a0',
		'a1',
		'a2',
		'a3',
		'w1',
		'wc'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'accessing' }
PhTransferFunction >> a0 [

	^ a0
]

{ #category : 'accessing' }
PhTransferFunction >> a0: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> a1 [

	^ a1
]

{ #category : 'accessing' }
PhTransferFunction >> a1: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> a2 [

	^ a2
]

{ #category : 'accessing' }
PhTransferFunction >> a2: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> a3 [

	^ a3
]

{ #category : 'accessing' }
PhTransferFunction >> a3: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> b0 [

	^ b0
]

{ #category : 'accessing' }
PhTransferFunction >> b0: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> b1 [

	^ b1
]

{ #category : 'accessing' }
PhTransferFunction >> b1: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> b2 [

	^ b2
]

{ #category : 'accessing' }
PhTransferFunction >> b2: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> b3 [

	^ b3
]

{ #category : 'accessing' }
PhTransferFunction >> b3: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> w1 [

	^ w1
]

{ #category : 'accessing' }
PhTransferFunction >> w1: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhTransferFunction >> wc [

	^ wc
]

{ #category : 'accessing' }
PhTransferFunction >> wc: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
