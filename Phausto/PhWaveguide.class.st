"
Standard pm.lib waveguide (based on waveguideFd4).

## Parameters: 

**nMax:** the maximum length of the delays in the waveguide
**n:** the length of the delay lines in samples.

"
Class {
	#name : 'PhWaveguide',
	#superclass : 'PhPmElement',
	#instVars : [
		'nMax',
		'n'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhWaveguide class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#nMax -> 'the maximum length of the delays in the waveguide'.
			#n -> 'the length of the delay lines in samples.' }
]

{ #category : 'faust' }
PhWaveguide class >> argumentNames [

	^ #( #nMax #n )
]

{ #category : 'faust' }
PhWaveguide class >> faustName [

	^ 'waveguide'
]

{ #category : 'initialization' }
PhWaveguide >> initializeArguments [

	nMax := 512.
	n := PhHSlider new
			label: self label , 'N'
			values: #( 32 1 511 1 )
]

{ #category : 'accessing' }
PhWaveguide >> n [

	^ n
]

{ #category : 'accessing' }
PhWaveguide >> n: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhWaveguide >> nMax [

	^ nMax
]

{ #category : 'accessing' }
PhWaveguide >> nMax: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
