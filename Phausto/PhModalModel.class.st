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
	#superclass : 'PhPmFunction',
	#instVars : [
		'numberOfModes',
		'freqs',
		't60s',
		'gains'
	],
	#category : 'Phausto-PhysModels',
	#package : 'Phausto',
	#tag : 'PhysModels'
}

{ #category : 'faust' }
PhModalModel class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#numberOfModes -> 'number of given modes'.
			#freqs -> 'list of filter center freqencies'.
			#t60s -> 'list of mode resonance durations (in seconds)'.
			#gains -> 'list of mode gains (0-1)' }
]

{ #category : 'faust' }
PhModalModel class >> argumentNames [

	^ #( #numberOfModes #freqs #t60s #gains )
]

{ #category : 'faust' }
PhModalModel class >> faustName [

	^ 'modalModel'
]

{ #category : 'accessing' }
PhModalModel >> freqs [

	^ freqs
]

{ #category : 'accessing' }
PhModalModel >> freqs: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModalModel >> gains [

	^ gains
]

{ #category : 'accessing' }
PhModalModel >> gains: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhModalModel >> initializeArguments [

	numberOfModes := 4.
	freqs := #( 220 440 550 770 ).
	t60s := #( 1.6 0.3 0.1 0.1 ).
	gains := #( 0.8 0.5 0.4 0.2 ).
	input := Pulse new period: 0.16
]

{ #category : 'accessing' }
PhModalModel >> numberOfModes [

	^ numberOfModes
]

{ #category : 'accessing' }
PhModalModel >> numberOfModes: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhModalModel >> t60s [

	^ t60s
]

{ #category : 'accessing' }
PhModalModel >> t60s: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
