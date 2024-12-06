"
DC blocker. Default dc blocker has -3dB point near 35 Hz (at 44.1 kHz) and high-frequency gain near 1.0025 (due to no scaling).
"
Class {
	#name : 'DcBlocker',
	#superclass : 'PhFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
DcBlocker >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox :=  self input connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'initialization' }
DcBlocker >> initialize [

	super initialize.
	self processExpression: 'process = fi.dcblocker;'
]
