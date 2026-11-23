"
SVF filters that also take a gain in dB: bell, low shelf and high shelf (fi.svf.bell, fi.svf.ls, fi.svf.hs).

**frequency:** center / transition frequency (Hz)
**q:** quality factor
**gain:** gain in dB

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'PhSvfGainFilter',
	#superclass : 'PhStateVariableFilter',
	#instVars : [
		'gain'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhSvfGainFilter >> asBox [

	^ self frequency asBox , self q asBox , self gain asBox , self input asBox connectTo: self code asBox
]

{ #category : 'accessing' }
PhSvfGainFilter >> gain [

	^ gain
]

{ #category : 'initialization' }
PhSvfGainFilter >> initialize [

	super initialize.
	gain := PhHSlider new label: self label , 'Gain' values: #( 6 -24 24 0.1 )
]
