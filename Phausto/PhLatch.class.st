"
Latch input on the rising edge of trig. Captures (""records"") the input x whenever trig crosses from ≤0 to >0, and holds the last captured value at all other times.

##Parameters:

**trig:** trigger signal. A rising edge (≤0 → >0) samples the input.
"
Class {
	#name : 'PhLatch',
	#superclass : 'PhBasics',
	#instVars : [
		'trig'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhLatch >> asBox [ 

^ self trig , self input asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhLatch >> initialize [

	super initialize.
	processExpression := 'process = ba.latch;'.
	trig := PhButton new label: 'TrigLatch'.
	input := 0
]

{ #category : 'accessing' }
PhLatch >> input [ 

^ input 
]

{ #category : 'accessing' }
PhLatch >> trig [ 

^ trig
]
