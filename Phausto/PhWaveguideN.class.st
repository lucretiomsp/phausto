"
A series of waveguide functions based on various types of delays (see [`fdelay[n]`](#fdelayn)).

Faust: `pm.waveguideN(nMax, n)` (3 in / 3 out)

## Parameters

- **delayType**: selects the waveguide: 'Ud' unit delay, 'Fd' fractional delay, 'Fd2' second order, 'Fd4' fourth order fractional delay
- **nMax**: the maximum length of the delays in the waveguide _(compile-time constant: give me a Number)_
- **n**: the length of the delay lines in samples.

## Example

```language=Pharo
(PhLStringRigidTermination new => PhWaveguideN new => PhRStringRigidTermination new) endChain stereo asDsp
```
"
Class {
	#name : 'PhWaveguideN',
	#superclass : 'PhPmElement',
	#instVars : [
		'delayType',
		'nMax',
		'n'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhWaveguideN class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#nMax -> 'the maximum length of the delays in the waveguide'.
			#n -> 'the length of the delay lines in samples.' }
]

{ #category : 'faust' }
PhWaveguideN class >> argumentNames [

	^ #( #nMax #n )
]

{ #category : 'faust' }
PhWaveguideN class >> faustName [

	^ 'waveguideN'
]

{ #category : 'accessing' }
PhWaveguideN >> delayType [

	^ delayType
]

{ #category : 'accessing' }
PhWaveguideN >> delayType: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'faust' }
PhWaveguideN >> faustName [

	"delayType selects the waveguide: 'Ud' unit delay, 'Fd' fractional delay, 'Fd2' second order, 'Fd4' fourth order fractional delay"

	^ 'waveguide' , delayType
]

{ #category : 'initialization' }
PhWaveguideN >> initializeArguments [

	delayType := 'Fd4'.
	nMax := 512.
	n := PhHSlider new
			label: self label , 'N'
			values: #( 32 1 511 1 )
]

{ #category : 'accessing' }
PhWaveguideN >> n [

	^ n
]

{ #category : 'accessing' }
PhWaveguideN >> n: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhWaveguideN >> nMax [

	^ nMax
]

{ #category : 'accessing' }
PhWaveguideN >> nMax: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
