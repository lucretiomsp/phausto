"
Outputs current max value above zero.

##Parameters:

**mode:**

_0_ - Pass through. A single sample 0 trigger will work as a reset.

_1_ - Track and hold max value.
"
Class {
	#name : 'PhPeakHold',
	#superclass : 'UnitGenerator',
	#instVars : [
		'mode',
		'input'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhPeakHold >> asBox [ 

^ self mode asBox , self input asBox connectTo: super asBox 
]

{ #category : 'initialization' }
PhPeakHold >> initialize [

	super initialize.
	processExpression := 'process = ba.peakhold;'.
	input := 0.
	mode := PhHSlider new label: 'PeakHoldMode' values: #(0 0 1 1)
]

{ #category : 'accessing' }
PhPeakHold >> input [ 

^ input
]

{ #category : 'accessing' }
PhPeakHold >> mode [ 

^ mode
]
