"
A Slider for a DSP parameter
"
Class {
	#name : #PhSlider,
	#superclass : #Morph,
	#instVars : [
		'address',
		'faderCanMove',
		'cursor',
		'minValue',
		'maxValue',
		'cursorColor',
		'index',
		'dsp'
	],
	#category : 'Phaust-GUI'
}

{ #category : #'instance creation' }
PhSlider class >> closeAll [

	| fadersInWorld |
	
	fadersInWorld := self  currentWorld submorphs select: [ :i |
		                 i class = FaderWindow  ].
	fadersInWorld do: [ :i | i delete ]
]

{ #category : #'instance creation' }
PhSlider class >> newWithAddress: anAddress [

	" the fader label is also the OSC address"

	^ self new
		  address: anAddress;
		  extent: 200 @ 600;
		  color: Color random;
		  cursorColor: Color black;
		  minValue: 0;
		  maxValue: 1;
		  yourself
]

{ #category : #'instance creation' }
PhSlider class >> newWithIndex: anIndex forDSP: aDSP [

	" the fader label is also the OSC address"

	^ self new
		  address: ((aDSP getParamAddress: anIndex) allButFirst: 5);
		  "cut the first part of the address to get just the parameter name"
		  index: anIndex;
		  extent: 200 @ 600;
		  color: Color random;
		  cursorColor: Color black;
		  minValue: (aDSP getParamMin: anIndex );
		  maxValue: (aDSP getParamMax: anIndex );
		  dsp: aDSP;
		  yourself
]

{ #category : #accessing }
PhSlider >> address [ 
^ address 
]

{ #category : #accessing }
PhSlider >> address: anAddress [
"set address (and labels)"
address := anAddress 
]

{ #category : #accessing }
PhSlider >> cursorColor [
^ cursorColor
]

{ #category : #accessing }
PhSlider >> cursorColor: aColor [
cursor color: aColor
]

{ #category : #'as yet unclassified' }
PhSlider >> drawCursor [
"draw the fader cursor"
| cursorWidth cursorHeight |

cursorHeight := self extent y /5.
cursorWidth := self width.

cursor extent: 400@cursorHeight .

self addMorph: cursor.
cursor center: self center.
]

{ #category : #accessing }
PhSlider >> dsp [ 
^ dsp
]

{ #category : #accessing }
PhSlider >> dsp: aDSP [ 
dsp := aDSP
]

{ #category : #'event handling' }
PhSlider >> handlesMouseDown: anEvent [
^ true
]

{ #category : #'event handling' }
PhSlider >> handlesMouseMove: anEvent [
^ true
]

{ #category : #'event handling' }
PhSlider >> handlesMouseUp: anEvent [
^ true
]

{ #category : #accessing }
PhSlider >> index [
^ index
]

{ #category : #accessing }
PhSlider >> index: anInteger [
index := anInteger
]

{ #category : #initialization }
PhSlider >> initialize [

	super initialize.
	faderCanMove := false.

	"self extent: 400@500"
	cursor := Morph new extent: 400 @ 300.
	cursor color: Color red.
	self drawCursor
]

{ #category : #accessing }
PhSlider >> maxValue: aNumber [
maxValue := aNumber asFloat .
]

{ #category : #accessing }
PhSlider >> minValue: aNumber [
minValue := aNumber asFloat .
]

{ #category : #'event handling' }
PhSlider >> mouseDown: anEvent [


faderCanMove := true.




]

{ #category : #'as yet unclassified' }
PhSlider >> mouseMove: anEvent [
" the VerticalFaderForSuperDirt modify the contents of the Sequencer in Performance named as destination"
	| newLocation mappedY cursorY faderBottom range faderTop |
	range := maxValue - minValue.
   
	faderCanMove
		ifTrue: [ 
			faderBottom := self extent y + self position y.
			faderTop := self position y.
			cursorY := (anEvent position y min: faderBottom) max: faderTop.
			newLocation := Point x: self center x y: cursorY.
			cursor center: newLocation.
			"map cursorY to value from 0 to 1"
			mappedY := (((cursorY min: faderBottom) - faderBottom) abs min:
				            self extent y) / self extent y * range + minValue.
				
			dsp setValue: mappedY  parameterIndex: index.
				]
				
			ifFalse: [ ] 
			
]

{ #category : #'event handling' }
PhSlider >> mouseUp: anEvent [
faderCanMove := false
]

{ #category : #'as yet unclassified' }
PhSlider >> openInWindow [
   
|faderWidth faderHeight positionLeft positionTop  bgColor|

faderWidth := 150.
faderHeight := self currentWorld height / 2.1.
positionLeft := self currentWorld width - faderWidth .
positionTop := (self currentWorld submorphs at: 1) extent y + faderHeight .
bgColor := Color random lighter lighter.
self color: bgColor.
self cursorColor: Color black.

	^ ((self openInWindowLabeled: address  ) position: (positionLeft @positionTop )) extent: faderWidth@faderHeight.
]
