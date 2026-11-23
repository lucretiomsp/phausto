"
4th-order Linkwitz-Riley filters and crossovers (two cascaded Butterworth SVFs), from the Faust filters library.
Lowpass and highpass outputs of the same cutoff sum to an allpass, which makes them the standard choice for crossovers.

**cutoff:** cutoff frequency (Hz)

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'PhLinkwitzRileyFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'cutoff'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhLinkwitzRileyFilter >> asBox [

	^ self cutoff asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhLinkwitzRileyFilter >> cutoff [

	^ cutoff
]

{ #category : 'initialization' }
PhLinkwitzRileyFilter >> initialize [

	super initialize.
	cutoff := PhHSlider new label: self label , 'Cutoff' values: #( 1000 20 18000 1 )
]
