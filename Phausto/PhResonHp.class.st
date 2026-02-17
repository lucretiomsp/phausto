"
Class: ResonBp
                                                                                                    
Simple resonant highpass filters based on tf2s (virtual analog).
"
Class {
	#name : 'PhResonHp',
	#superclass : 'ResonatorFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
PhResonHp >> initialize [

	super initialize.
	processExpression := 'process = fi.resonhp;'.
	frequency := PhHSlider new
		             label: self label , 'Frequency'
		             init: 25
		             min: 25
		             max: 22040
		             step: 1
]
