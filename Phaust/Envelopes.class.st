"
This library contains a collection of envelope generators from Faust envelopes.lib
All the envelopes have at least an attack time and a release time.
To be triggered they need to receive an input greater than 0

for example:
(Button new label: 'trigger' ) connectTo: AREnv new
"
Class {
	#name : #Envelopes,
	#superclass : #CTree,
	#instVars : [
		'attack',
		'release'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #initialization }
Envelopes >> initialize [

	attack := 0.001.
	release := 0.2.
	
]
