"
Implement a single resonance modes using **resonant bandpass filters**.
Any linear percussion instrument can be implemented using a bank of resonant bandpass filters and an exciter.
Learn more about [Physical Audio Signals](https://ccrma.stanford.edu/~jos/pasp/).

** Be careful, this does not truly correspnd to Faust original ModalModel - if you want multiple resonances you have to create an array of ModalModels in Phausto

## Parameters
- **numberOfModes**: number of given modes
- **freqs** : filter center freqency in Hertz
- **t60s** :  mode resonance durations (in seconds)
- **gains** :mode gain (0-1)
- **input** : the excitation input
"
Class {
	#name : 'PhModalModel',
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
PhModalModel >> asBox [

	| result |
	result := OrderedCollection new.
	1 to: numberOfModes do: [ :i | "| intermediateBox finalBox |
	intermediateBox := super asBox.
	""finalBox := self freqs asBox , self t60s asBox , self gains asBox
	            , self input asBox connectTo: intermediateBox.""
	finalBox := self freqs asBox , self t60s asBox
	            , self gains asBox asBox , self input asBox connectTo:
		            intermediateBox.
	^ super asBox"
			result add: (PhModeFilter new
					 freq: (freqs at: i);
					 t60: (t60s at: i);
					 gain: (gains at: i); input: self input ) ].
	^ result asSumOfUGen asBox
]

{ #category : 'accessing' }
PhModalModel >> freqs [

	^ freqs
]

{ #category : 'accessing' }
PhModalModel >> freqs: anArrayOfFreq [

	freqs := anArrayOfFreq 
]

{ #category : 'accessing' }
PhModalModel >> gains [

	^ gains
]

{ #category : 'accessing' }
PhModalModel >> gains: anArrayOfGains [

	gains := anArrayOfGains 
]

{ #category : 'initialization' }
PhModalModel >> initialize [
	"default ModalModel comes from the example in the Faust libraries documentation but is triggered with a Pulsen"

	super initialize.
	processExpression := 'process = pm.modalModel(1);'.
	numberOfModes := 4.
	freqs := #( 220 440 550 770).
	t60s := #(0.6 0.3 0.1 0.1).
	gains := #(0.8 0.5 0.4 0.2).
	input := Pulse new period: 0.16
]

{ #category : 'accessing' }
PhModalModel >> input [

	^ input
]

{ #category : 'accessing' }
PhModalModel >> numberOfModes [

	^ numberOfModes
]

{ #category : 'accessing' }
PhModalModel >> t60s [

	^ t60s
]

{ #category : 'accessing' }
PhModalModel >> t60s: anArrayOfT60 [

	freqs := anArrayOfT60
]
