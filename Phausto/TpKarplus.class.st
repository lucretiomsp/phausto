"
Ready to use Karplus strong !
"
Class {
	#name : 'TpKarplus',
	#superclass : 'UnitGenerator',
	#instVars : [
		'noteToLen',
		'exciter'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'converting' }
TpKarplus >> asBox [

	^ ((PhKarplusStrong new
		   length: noteToLen;
		   excitation: exciter) * uLevel )asBox
]

{ #category : 'initialization' }
TpKarplus >> initialize [

	super initialize.
	noteToLen := PhF2l new label: 'tpKarplus'.
	exciter := PhImpulseExcitation new gate: #tpKarplusTrigger.
	uLevel := PhHSlider new label: 'tpKarplusLevel' values: #(0.5 0 1 0.01).
	
]
