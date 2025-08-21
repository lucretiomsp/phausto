"
PhSubBeat is an object that generates triggers at a specified subdivision of a beat, such as 32nd notes. It acts as a clock divider and can operate at any tempo, aligning with the main beat or clock source.
Differently from PhBeat, it must be started.
Paraameter:
tempo: the tempo in beays per minutes
clockDivider: the clock divisions, set 2 for 16th notes, 4 to for 8th notes, 8 for beats.
start: start and stop the Trigger generation

"
Class {
	#name : 'PhSubBeat',
	#superclass : 'UnitGenerator',
	#instVars : [
		'clockDivider',
		'tempo',
		'start'
	],
	#category : 'Phausto-ToolKit',
	#package : 'Phausto',
	#tag : 'ToolKit'
}

{ #category : 'initialization' }
PhSubBeat >> asBox [

	| subBeat subDivision |
	subDivision := self tempo asBox * (8 asBox / self clockDivider asBox).
	subBeat := (PhBeat new tempo: subDivision) asBox * self start asBox.
	^ subBeat
]

{ #category : 'accessing' }
PhSubBeat >> clockDivider [

	^ clockDivider 
]

{ #category : 'initialization' }
PhSubBeat >> initialize [

	super initialize.
	tempo := PhHSlider new
		         label: self label , 'Tempo'
		         init: 120
		         min: 30
		         max: 220
		         step: 0.01.
	start := PhCheckbox new label: self label , 'Start'.
	clockDivider := PhHSlider new
		                label: self label , 'ClockDivider'
		                init: 8
		                min: 1
		                max: 32
		                step: 0.01
]

{ #category : 'accessing' }
PhSubBeat >> start [

	^ start 
]

{ #category : 'accessing' }
PhSubBeat >> tempo [

	^ tempo 
]
