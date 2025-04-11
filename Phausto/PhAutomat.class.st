"
Record and replay in a loop the successives values of the input signal.

## Parameters:
**tempo**: tempo in BPM;
**size**: number of items in the loop;
**init**: initial value in the loop;


### Example
```language=Pharo
""control the pitch of an oscillator changing the value of AutomatInput""
auto := PhAutomat new.
osci := SawOsc new freq: auto  midikey2hz .
```

"
Class {
	#name : 'PhAutomat',
	#superclass : 'UnitGenerator',
	#instVars : [
		'tempo',
		'size',
		'init',
		'input'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhAutomat >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.

	"finalBox := self tempo asBox , self size asBox , self init  asBox , self input asBox
		            connectTo: intermediateBox.
"
	finalBox := self tempo asBox , self size asBox , self init , self input asBox
		            connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'accessing' }
PhAutomat >> init [

	^ init
]

{ #category : 'initialization' }
PhAutomat >> initialize [

	super initialize.
	processExpression := 'process=ba.automat;'.
	size := 8.
	init := 28.
	tempo := PhHSlider new label: 'AutomTempo' values: #( 120 120 560 1 ).
	input := PhHSlider new label: 'AutomInput' values: #( 38 38 56 1 )
]

{ #category : 'accessing' }
PhAutomat >> input [

	^ input
]

{ #category : 'accessing' }
PhAutomat >> size [

	^ size
]

{ #category : 'accessing' }
PhAutomat >> tempo [
^ tempo
]
