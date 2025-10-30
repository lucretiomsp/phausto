"
This class contains a collection of synthesizers, including those of Faust synths.lib

** Do not use this superclass directly; it exists only for grouping and establishing a basic inheritance chain. Use one of its subclasses instead.**
"
Class {
	#name : 'Synths',
	#superclass : 'UnitGenerator',
	#instVars : [
		'trigger',
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

	^ trigger
]

{ #category : 'initialization' }
Synths >> initialize [

	super initialize.

	freq := PhHSlider new
		        label: self label , 'Freq'
		        init: 440
		        min: 20
		        max: 1200
		        step: 1.
			trigger := PhButton new
		         label: self label , 'Trigger'.
]

{ #category : 'accessing' }
Synths >> trigger [

	^ trigger
]
