"
Implement multiple resonance modes using **resonant bandpass filters**.
Any linear percussion instrument can be implemented using a bank of resonant bandpass filters and an exciter.
Lear more about [Physical Audio Signals](https://ccrma.stanford.edu/~jos/pasp/).

## Parameters
- **numberOfModes**: number of given modes
- **freqs** : list of filter center freqencies in Hertz
- **t60s** : list of mode resonance durations (in seconds)
- **gains** : list of mode gains (0-1)
- **input** : the excitation input
"
Class {
	#name : 'ModalModel',
	#superclass : 'UnitGenerator',
	#instVars : [
		'numberOfModes',
		'freqs',
		't60s',
		'gains',
		'input'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'converting' }
ModalModel >> asBox [

	| intermediateBox finalBox |
	intermediateBox := super asBox.
	"finalBox := self freqs asBox , self t60s asBox , self gains asBox
	            , self input asBox connectTo: intermediateBox."
	finalBox := 440 asBox , 0.5 asBox , 0.5 asBox , self input asBox
		            connectTo: intermediateBox.
	^ intermediateBox
]

{ #category : 'accessing' }
ModalModel >> freqs [

	^ freqs
]

{ #category : 'accessing' }
ModalModel >> gains [

	^ gains
]

{ #category : 'initialization' }
ModalModel >> initialize [
	"default ModalModel comes from the example in the Faust libraries documentation but is triggered with a Pulsen"

	super initialize.
	processExpression := 'process = pm.modalModel(1);'.
	freqs := 440 asBox , 660 .
	t60s := 0.5 asBox , 0.25 .
	gains := 0.6 asBox , 0.8 .
	input := Pulse new period: 0.16. 
]

{ #category : 'accessing' }
ModalModel >> input [

	^ input
]

{ #category : 'accessing' }
ModalModel >> numberOfModes [

	^ numberOfModes
]

{ #category : 'accessing' }
ModalModel >> t60s [

	^ t60s
]
