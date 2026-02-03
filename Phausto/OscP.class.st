"
Wave-Table Based sine wave generator with controllable phase

##Parameters::

**freq:** the frequency in Hz
**phase:* the phase in radian
"
Class {
	#name : 'OscP',
	#superclass : 'Oscillator',
	#instVars : [
		'phase'
	],
	#category : 'Phausto-Oscillators',
	#package : 'Phausto',
	#tag : 'Oscillators'
}

{ #category : 'converting' }
OscP >> asBox [ 

| finalBox |
finalBox := self freq asBox , self phase asBox connectTo: self code asBox.
^ finalBox * self uLevel.
]

{ #category : 'initialization' }
OscP >> initialize [

	super initialize.
	phase := PhHSlider new
		         label: self label , 'Phase'
		         values: #( 0 0 6.28 0.1 ).
		processExpression := 'process = os.oscp;'
]

{ #category : 'accessing' }
OscP >> phase [ 
^ phase
]
