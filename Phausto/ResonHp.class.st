"
Class: ResonBp
                                                                                                    
Simple resonant highpass filters based on tf2s (virtual analog).
"
Class {
	#name : 'ResonHp',
	#superclass : 'ResonatorFilter',
	#category : 'Phausto-Filters',
	#package : 'Phausto',
	#tag : 'Filters'
}

{ #category : 'initialization' }
ResonHp >> initialize [

	super initialize.
	processExpression := 'process = fi.resonhp;'
]
