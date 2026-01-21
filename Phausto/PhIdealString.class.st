"
An ""ideal"" string with rigid terminations and where the plucking position and the pick-up position are the same. Since terminations are rigid, this string will ring forever.
"
Class {
	#name : 'PhIdealString',
	#superclass : 'PhStringAbstract',
	#category : 'Phausto-PhysModels - String Instruments',
	#package : 'Phausto',
	#tag : 'PhysModels - String Instruments'
}

{ #category : 'converting' }
PhIdealString >> asBox [



	^ self inputBlock asBox , self length asBox , self pluckPosition
	  , self excitation asBox connectTo: super asBox
]

{ #category : 'initialization' }
PhIdealString >> initialize [

	super initialize.
	processExpression := 'process = pm.idealString;'
]
