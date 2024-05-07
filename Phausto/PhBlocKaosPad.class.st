"
Experimmental Bloc X/Y controller a la Korg Kaos Pad
"
Class {
	#name : #PhBlocKaosPad,
	#superclass : #BlElement,
	#instVars : [
		'destinationX',
		'destinationY',
		'dsp',
		'initValue',
		'minValue',
		'maxValue',
		'w',
		'h'
	],
	#category : #'Phausto-GUI'
}

{ #category : #'instance creation' }
PhBlocKaosPad class >> new: anArrayWithDestXAndDestY [

	^ self new destinationX: (anArrayWithDestXAndDestY at: 1); destinationY: (anArrayWithDestXAndDestY at: 2)
]

{ #category : #accessing }
PhBlocKaosPad >> destinationX [

	^ destinationX
]

{ #category : #accessing }
PhBlocKaosPad >> destinationX: anObject [

	destinationX := anObject
]

{ #category : #accessing }
PhBlocKaosPad >> destinationY [

	^ destinationY
]

{ #category : #accessing }
PhBlocKaosPad >> destinationY: anObject [

	destinationY := anObject
]

{ #category : #accessing }
PhBlocKaosPad >> dsp [

	^ dsp
]

{ #category : #accessing }
PhBlocKaosPad >> dsp: anObject [

	dsp := anObject
]

{ #category : #accessing }
PhBlocKaosPad >> initValue [

	^ initValue
]

{ #category : #accessing }
PhBlocKaosPad >> initValue: anObject [

	initValue := anObject
]

{ #category : #initialization }
PhBlocKaosPad >> initialize [

	| cursor p |
	super initialize.

	self
		destinationX: 'X';
		destinationY: 'Y'.

	self
		background: Color red;
		size: 400 @ 400.

	cursor := BlElement new
		          background: Color yellow;
		          geometry: BlCircleGeometry new;
		          size: 50 @ 50;
		          position: 20 @ 20.


	self addChild: cursor.

	cursor addEventHandlerOn: BlDragStartEvent do: [ :evt |
		p := evt position - cursor position.
		evt consumed: true ].

	cursor addEventHandlerOn: BlDragEvent do: [ :evt |
		cursor position: evt position - p.
		self dsp setValue: evt position x / 400 parameter: destinationX.
		self dsp setValue: (400 -( evt position y + 20)) parameter: destinationY ]
]

{ #category : #accessing }
PhBlocKaosPad >> maxValue [

	^ maxValue
]

{ #category : #accessing }
PhBlocKaosPad >> maxValue: anObject [

	maxValue := anObject
]

{ #category : #accessing }
PhBlocKaosPad >> minValue [

	^ minValue
]

{ #category : #accessing }
PhBlocKaosPad >> minValue: anObject [

	minValue := anObject
]

{ #category : #'host space - displaying' }
PhBlocKaosPad >> show [

	| space |
	space := BlSpace new extent: 400 @ 400.
	space title: self destinationX , ' / ' , self destinationY.

	space root addChild: self.
	space show
]
