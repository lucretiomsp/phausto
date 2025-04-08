"
Simple resonant bandpass filters based on tf2s (virtual analog).
"
Class {
	#name : 'ResonBp',
	#superclass : 'ResonatorFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
ResonBp >> initialize [

	super initialize.
	processExpression := 'process = fi.resonbp;'.	     
	frequency := PhHSlider new
		             label: self label , 'Frequency'
		             init: 5000
		             min: 25
		             max: 22040
		             step: 1
	
]
