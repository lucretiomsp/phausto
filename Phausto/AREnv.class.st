"
AR (Attack, Release) envelope generator (useful to create percussion envelopes). 

Usage
ar(at,rt,t) : _
Where:

at: attack (sec)
rt: release (sec)
t: trigger signal (attack is triggered when t>0, release is triggered when t=0)
"
Class {
	#name : 'AREnv',
	#superclass : 'PhEnvelope',
	#category : 'Phausto-UnitGenerators',
	#package : 'Phausto',
	#tag : 'UnitGenerators'
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
