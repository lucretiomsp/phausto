"
Regalia-Mitra second order peaking equalizer section.

##Parameters
**lfx:** level (dB) at fx
**fx:** boost or cut frequency (Hz)
**tanPiBT:** tan(PI*B/SR), where B = -3dB bandwidth (Hz) when 10^(Lfx/20) = 0 ~ PI*B/SR for narrow bandwidths B

"
Class {
	#name : 'PhPeakEqRm',
	#superclass : 'PhFilter',
	#instVars : [
		'lfx',
		'fx',
		'tanPiBT'
	],
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'converting' }
PhPeakEqRm >> asBox [

	^ self lfx asBox , self fx asBox , self tanPiBT asBox , self input asBox
		  connectTo: self code asBox
]

{ #category : 'accessing' }
PhPeakEqRm >> fx [
^ fx
]

{ #category : 'initialization' }
PhPeakEqRm >> initialize [

	super initialize.
	processExpression := 'process = fi.peak_eq_rm;'.
	lfx := PhHSlider new
		       label: self label , 'Lfx'
		       values: #( 2 -6 6 0.01 ).
	fx := PhHSlider new
		      label: self label , 'Fx'
		      values: #( 600 20 8000 1 ).
	tanPiBT := PhHSlider new label: self label , 'Q' values: #( 3 0.01 8 0.01 )
]

{ #category : 'accessing' }
PhPeakEqRm >> lfx [ 
^ lfx
]

{ #category : 'accessing' }
PhPeakEqRm >> tanPiBT [

^ tanPiBT
]
