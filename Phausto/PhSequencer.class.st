"
High level abstractio for sequencer
"
Class {
	#name : 'PhSequencer',
	#superclass : 'UnitGenerator',
	#instVars : [
		'pattern',
		'selector',
		'counter',
		'trigger'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'converting' }
PhSequencer >> asBox [

	| finalBox |
	counter max
		init: pattern size;
		max: pattern size.


	finalBox := self selector
		            list: self pattern asPhList;
		            index: (self counter trigger: self trigger).
	^ finalBox asBox

	"PhSelectN new list: #(0 1 2 3 1 2 3 12 3) asPhList; index: (PhTkCounter new trigger: PhSubBeat new)."
]

{ #category : 'accessing' }
PhSequencer >> counter [ 

^ counter
]

{ #category : 'initialization' }
PhSequencer >> initialize [

	super initialize.
	selector := PhSelectN new.
	counter := PhTkCounter new.
	pattern := #( 0 1 2 3 4 5 6 ).
	trigger := PhSubBeat new
]

{ #category : 'accessing' }
PhSequencer >> pattern [ 
 ^ pattern
]

{ #category : 'accessing' }
PhSequencer >> pattern: anArray [

pattern := anArray
]

{ #category : 'accessing' }
PhSequencer >> selector [ 

^ selector 
]

{ #category : 'accessing' }
PhSequencer >> trigger [ 
^ trigger
]

{ #category : 'accessing' }
PhSequencer >> trigger: aTrigger [

	trigger := aTrigger 
]
