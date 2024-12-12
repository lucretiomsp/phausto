"
4th order virtual analog diode ladder filter. In addition to the individual states used within each independent 1st-order filter, there are also additional feedback paths found in the block diagram. These feedback paths are labeled as connecting states. Rather than separately storing these connecting states in the Faust implementation, they are simply implicitly calculated by tracing back to the other states (s1,s2,s3,s4) each recursive step.

Paameters: 
normFreq: normalized frequency (0-1)
Q: q

This filter was implemented in Faust by Eric Tarr during the 2019 Embedded DSP With Faust Workshop.

References
https://www.willpirkle.com/virtual-analog-diode-ladder-filter/
http://www.willpirkle.com/Downloads/AN-6DiodeLadderFilter.pdf
"
Class {
	#name : 'DiodeLadder',
	#superclass : 'MKOFilters',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
DiodeLadder >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self normFreq , self q , self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
DiodeLadder >> initialize [

	super initialize.
	self processExpression: 'process = ve.diodeLadder;'
]
