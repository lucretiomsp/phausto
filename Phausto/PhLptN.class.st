"
One-pole lowpass filter with arbitrary dis/charging factors set in dB and times set in seconds.

##Parameters:

**n:** is the attenuation factor in dB
**tN:** is the filter period in seconds, that is, the time for the impulse response to decay by n dB
"
Class {
	#name : 'PhLptN',
	#superclass : 'PhFilter',
	#instVars : [
		'zero',
		'n',
		'tN'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhLptN >> asBox [ 

^ self n asBox , self tN asBox , self input asBox connectTo: self code asBox
]

{ #category : 'initialization' }
PhLptN >> initialize [

	super initialize.
	processExpression := 'process = fi.lptN;'.
	n := PhHSlider new
		     label: self label , 'Attenuation'
		     values: #( 60 0 96 0.1 ).
	tN := PhHSlider new
		      label: self label , 'Period'
		      values: #( 0.1 0.01 2 0.01 )
]

{ #category : 'accessing' }
PhLptN >> n [ 
^ n 
]

{ #category : 'accessing' }
PhLptN >> tN [

	^ tN
]
