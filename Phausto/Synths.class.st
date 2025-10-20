"
This class contains a collection of synthesizers, including those of Faust synths.lib

** Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**
"
Class {
	#name : 'Synths',
	#superclass : 'UnitGenerator',
	#instVars : [
		'gate',
		'freq'
	],
	#category : 'Phausto-Synths',
	#package : 'Phausto',
	#tag : 'Synths'
}

{ #category : 'accessing' }
Synths >> freq [ 
^freq
]

{ #category : 'accessing' }
Synths >> gate [ 
^ gate
]

{ #category : 'initialization' }
Synths >> initialize [

	super initialize.
	gate := PhButton new label: self label , 'Trigger'.
	freq := PhHSlider new
			          label: self label , 'Freq'
			          init: 440
			          min: 20
			          max: 1200
			          step: 1.
	
]
