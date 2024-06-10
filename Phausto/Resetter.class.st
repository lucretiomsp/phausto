"
I am a Resetter, when triggered,  I set my value to 0. My other input is a Wire, as I am dsigned to be used in a SampleFile or Wavetable reader
"
Class {
	#name : #Resetter,
	#superclass : #PhBox,
	#instVars : [
		'trigger'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
Resetter >> asBox [ 

^ BoxAPI uniqueInstance boxSelect2Aux: self trigger input0: Wire new asBox input1: 0 asBox
]

{ #category : #initialization }
Resetter >> initialize [ 

super initialize.
self trigger: 0 
]

{ #category : #accessing }
Resetter >> trigger [

	^ trigger
]

{ #category : #accessing }
Resetter >> trigger: aTrigger [ 

	trigger := aTrigger asBox
]
