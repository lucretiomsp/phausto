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
	self counter  max: (PhHSlider new label: self label  values: {pattern size . 0 . pattern size .1}).
	
	finalBox := self selector
		            list: self pattern asPhZeroList;
		            index: self counter.
	^ finalBox asBox

	"PhSelectN new list: #(0 1 2 3 1 2 3 12 3) asPhList; index: (PhTkCounter new trigger: PhSubBeat new)."
]

{ #category : 'accessing' }
PhSequencer >> counter [ 

^ counter
]

{ #category : 'accessing' }
PhSequencer >> counter: aCounter [

	counter := aCounter
]

{ #category : 'initialization' }
PhSequencer >> initialize [

	super initialize.
	selector := PhSelectN new.
	counter := PhTkCounter new trigger: PhSubBeat  new.
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
