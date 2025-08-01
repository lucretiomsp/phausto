"
DC blocker with configurable ""break frequency"". The amplitude response is substantially flat above fb, and sloped at about +6 dB/octave below fb. Derived from the analog transfer function:
H(s)=s(s+2πfb)
(which can be seen as a 1st-order Butterworth highpass filter) by the low-frequency-matching bilinear transform method (i.e., using the typical frequency-scaling constant 2*SR).

parameter:
fb: ""break frequency"" in Hz, i.e., -3 dB gain frequency (see 2nd reference below)
"
Class {
	#name : 'DcBlockerAt',
	#superclass : 'PhFilter',
	#instVars : [
		'fb'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
DcBlockerAt >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self fb asBox, self input asBox connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
DcBlockerAt >> fb [

	^ fb ifNil: [
		  fb := PhHSlider new
			        label: self label , 'Fb'
			        init: 0
			        min: 0
			        max: 3
			        step: 0.001 ]
]

{ #category : 'initialization' }
DcBlockerAt >> initialize [

	super initialize.
	self processExpression: 'process = fi.dcblockerat;'
]
