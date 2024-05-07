"
Experimental Bloc Fader for Phausto
"
Class {
	#name : #PhBlocSlider,
	#superclass : #BlElement,
	#instVars : [
		'destination',
		'dsp',
		'initValue',
		'minValue',
		'maxValue'
	],
	#category : #'Phausto-GUI'
}

{ #category : #'instance creation' }
PhBlocSlider class >> new: aStringWithaDestination [

	^ self new destination: aStringWithaDestination
]

{ #category : #accessing }
PhBlocSlider >> destination [

	^ destination
]

{ #category : #accessing }
PhBlocSlider >> destination: anObject [

	destination := anObject
]

{ #category : #accessing }
PhBlocSlider >> dsp [

	^ dsp
]

{ #category : #accessing }
PhBlocSlider >> dsp: anObject [

	dsp := anObject
]

{ #category : #accessing }
PhBlocSlider >> initValue [

	^ initValue
]

{ #category : #accessing }
PhBlocSlider >> initValue: anObject [

	initValue := anObject
]

{ #category : #initialization }
PhBlocSlider >> initialize [

	| cursor p unlitBg |
	super initialize.
	self
		size: 120 @ 350;
		background: Color yellow.

	cursor := BlElement new
		          size: 120 @ 20;
		          background: Color yellow.
	unlitBg := BlElement new
		           background: Color white;
		           size: 120 @ 0.
	self
		addChild: unlitBg;
		addChild: cursor.
	cursor addEventHandlerOn: BlDragStartEvent do: [ :evt |
		p := evt position - cursor position.
		evt consumed: true ].

	cursor addEventHandlerOn: BlDragEvent do: [ :evt |
		cursor position: 0 @ ((evt position y - p y max: 0) min: 330).
		unlitBg position: 0 @ (evt position y - 350 min: -1).
		unlitBg size: 120 @ (350 - p y min: 350) ]
]

{ #category : #accessing }
PhBlocSlider >> maxValue [

	^ maxValue
]

{ #category : #accessing }
PhBlocSlider >> maxValue: anObject [

	maxValue := anObject
]

{ #category : #accessing }
PhBlocSlider >> minValue [

	^ minValue
]

{ #category : #accessing }
PhBlocSlider >> minValue: anObject [

	minValue := anObject
]

{ #category : #'host space - displaying' }
PhBlocSlider >> show [

	| space size |
	space := BlSpace new.
	size := self size.

	space extent: 120 @ 350.
	space root addChild: self.
	space title: self destination.
	space show
]
