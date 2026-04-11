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

^ (PhKarplusStrong new length: noteToLen ; excitation: exciter) asBox
]

{ #category : 'initialization' }
TpKarplus >> initialize [ 

super initialize .
noteToLen := PhF2l new label: 'karplusFreq'.
exciter := PhImpulseExcitation new gate: #karplusTrigger

]
