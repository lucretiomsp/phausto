"
Outputs current max value above zero.

##Parameters:
**mode:** 

_0_ - Pass through. A single sample 0 trigger will work as a reset.

_1_ - Track and hold max value
"
Class {
	#name : 'PhPeakHold',
	#superclass : 'PhBasics',
	#instVars : [
		'mode'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'converting' }
PhPeakHold >> asBox [

	^ self mode asBox , self input asBox connectTo: self code  asBox
]

{ #category : 'initialization' }
PhPeakHold >> initialize [ 

super initialize .
processExpression := 'process = ba.peakhold;'.
mode := 0
]

{ #category : 'accessing' }
PhPeakHold >> mode [ 
^ mode 
]

{ #category : 'accessing' }
PhPeakHold >> mode: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
