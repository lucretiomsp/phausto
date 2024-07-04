"
GreyHole reverb with dry/wet control. 
Dry is the signal without effect.
Wet is the processed signal
"
Class {
	#name : #GreyHoleDW,
	#superclass : #UnitGenerator,
	#instVars : [
		'dryWet',
		'inputL',
		'inputR'
	],
	#category : #'Phausto-ToolKit'
}

{ #category : #converting }
GreyHoleDW >> asBox [

	| reverb finalBox dry wet |
	reverb := self inputL =>  GreyHole new
		        .
	dry := self inputL * (self dryWet - 1 asBox).
	wet := (reverb asBox mergeWith: Wire new asBox) , self dryWet
		       connectTo: PhMultiplier new.
	finalBox := reverb asBox.
	^ finalBox
]

{ #category : #accessing }
GreyHoleDW >> dryWet [

	^ dryWet
]

{ #category : #accessing }
GreyHoleDW >> dryWet: anAmount [

	dryWet := anAmount asBox
]

{ #category : #initialization }
GreyHoleDW >> initialize [
super initialize .
	self dryWet: (PhHSlider new
			 label: self label , 'DryWet'
			 init: 0.1
			 min: 0
			 max: 1
			 step: 0.001).
			
		self inputL: 0.
		self inputR: 0.
]

{ #category : #accessing }
GreyHoleDW >> inputL [

	^ inputL
]

{ #category : #accessing }
GreyHoleDW >> inputL: anInput [

	inputL := anInput asBox
]

{ #category : #accessing }
GreyHoleDW >> inputR [

	^ inputR
]

{ #category : #accessing }
GreyHoleDW >> inputR: anInput [

	inputR := anInput asBox
]

{ #category : #connecting }
GreyHoleDW >> patchedWith: aUnitGenerator [

self inputL: aUnitGenerator .
self inputR: aUnitGenerator 
]
