"
**AR** (_Attack_, _Release_) envelope generator (useful to create percussion envelopes). 

## Parameters: 

-** attack**: attack (sec)
-** release**: release (sec)
-** trigger**: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'AREnv',
	#superclass : 'PhEnvelope',
	#category : 'Phausto-Envelopes',
	#package : 'Phausto',
	#tag : 'Envelopes'
}

{ #category : 'converting' }
AREnv >> asBox [

	| intermediateBox finalBox |
	
	intermediateBox := super asBox.
	finalBox := self attack asBox , self release asBox
	            , self trigger asBox connectTo: intermediateBox.
	^ finalBox
]

{ #category : 'initialization' }
AREnv >> initialize [

	super initialize.
	processExpression :=  'process = en.ar;'
]
