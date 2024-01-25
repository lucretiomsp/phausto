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
	#name : #AREnv,
	#superclass : #Envelopes,
	#category : #'Phaust-BoxAPI'
}

{ #category : #converting }
AREnv >> asBox [

	| box code |
	code := 'import("stdfaust.lib"); process = en.ar(' , attack asString
	        , ' , ' , release asString , ' , ' , ');'.
	box := BoxAPI uniqueInstance
		       boxFromString: code
		       inputs: self inputs
		       outputs: self outputs
		       buffer: self errorBuffer.

	^ box
]
