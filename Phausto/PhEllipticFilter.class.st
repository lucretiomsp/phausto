"
Elliptic (Cauer) filters from the Faust filters library, with a single cutoff frequency (Hz).
They have a steeper transition band than Butterworth filters of the same order, at the price of ripple in the passband and stopband.

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'PhEllipticFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'cutoff'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhEllipticFilter >> asBox [

	^ self cutoff asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhEllipticFilter >> cutoff [

	^ cutoff
]

{ #category : 'initialization' }
PhEllipticFilter >> initialize [

	super initialize.
	cutoff := PhHSlider new label: self label , 'Cutoff' values: #( 1000 20 18000 1 )
]
