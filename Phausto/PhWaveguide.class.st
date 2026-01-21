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
		'n',
		'nMax'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'initialization' }
PhWaveguide >> asBox [

	^ self inputBlock asBox , 512 asBox , 32 asBox connectTo:
		  super asBox
]

{ #category : 'initialization' }
PhWaveguide >> initialize [

	super initialize.
	processExpression := 'process = pm.waveguide;'.
	nMax := 512.
	n := 32.
	inputBlock := PhZeroList new addAll: #(0  0  0).
]

{ #category : 'accessing' }
PhWaveguide >> n [
^ n
]

{ #category : 'accessing' }
PhWaveguide >> nMax [

	^ nMax
]
