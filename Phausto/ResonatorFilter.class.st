"
Simple resonant filters based on tf2s (virtual analog).
Subclasses include lowpass, highpass, bandpass.
Cutoof control is smoothed.


## Parameters
- **frequency**
- **gain**
- **q**

**Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead. **
"
Class {
	#name : 'ResonatorFilter',
	#superclass : 'PhFilter',
	#instVars : [
		'q',
		'frequency',
		'gain'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
ResonatorFilter >> asBox [

	| intermdiateBox finalBox |
	intermdiateBox := super asBox.

	finalBox := self frequency smoo , self q , self gain , self input
		            connectTo: intermdiateBox.

	^ finalBox
]

{ #category : 'accessing' }
ResonatorFilter >> frequency [

	^ frequency ifNil: [
		  frequency := PhHSlider new
			               label: self label , 'Frequency'
			               init: 19000
			               min: 20
			               max: 19999
			               step: 1 ]
]

{ #category : 'accessing' }
ResonatorFilter >> gain [

	^ gain ifNil: [  gain := 1 asBox ]
]

{ #category : 'initialization' }
ResonatorFilter >> initialize [

	super initialize.
	

]

{ #category : 'accessing' }
ResonatorFilter >> q [

	^ q ifNil: [
		  q := PhHSlider new
			       label: self label ,'Q'
			       init: 1
			       min: 0.1
			       max: 24
			       step: 0.01 ]
]
