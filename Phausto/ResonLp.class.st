"
Class: ResonBp
                                                                                                    
Simple resonant lowpass filters based on tf2s (virtual analog).
"
Class {
	#name : #ResonLp,
	#superclass : #ResonatorFilter,
	#category : #'Phausto-BoxAPI-Filters'
}

{ #category : #initialization }
ResonLp >> initialize [

	super initialize.
	processExpression := 'process = fi.resonlp;'
]
