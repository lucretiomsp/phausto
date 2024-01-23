"
This class contains a collection of reverb taken from the Faust reverbs.lib
"
Class {
	#name : #Oscillators,
	#superclass : #CTree,
	#instVars : [
		'freq'
	],
	#category : #'Phaust-BoxAPI'
}

{ #category : #accessing }
Oscillators >> freq [

	^ freq
]

{ #category : #accessing }
Oscillators >> freq: aFloat [

	freq := aFloat
]

{ #category : #initialization }
Oscillators >> initialize [ 

super initialize .
self freq: 440.
]
