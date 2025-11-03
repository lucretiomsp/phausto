"
I am an abstract subclass of **TurboPhausto** made to create custom version of TurboPhausto.
Check how **EcoPhausto** is implemented in order to implement your own ensemble of instrument to be played with **Coypu**
"
Class {
	#name : 'CustomPhausto',
	#superclass : 'TurboPhausto',
	#classInstVars : [
		'allInstruments'
	],
	#category : 'Phausto-TurboPhausto',
	#package : 'Phausto',
	#tag : 'TurboPhausto'
}

{ #category : 'class initialization' }
CustomPhausto class >> initialize [ 

allInstruments := OrderedCollection new.
]

{ #category : 'as yet unclassified' }
CustomPhausto class >> listAllInstruments [

(allInstruments collect: [ :i | i label ]) inspect
]

{ #category : 'as yet unclassified' }
CustomPhausto class >> loadAllInstruments [

self subclassResponsibility 
]

{ #category : 'accessing' }
CustomPhausto class >> start [

	| perf |
	perf := Performance uniqueInstance .
	self tpDsp ifNotNil: [ self tpDsp isNull ifFalse: [ self tpDsp stop ] ].
	self loadAllInstruments .
	tpDsp := allInstruments asSumOfUGen stereo asDsp. "tpDsp := self rack stereo asDsp."
	[ [ [ self tpDsp ] value ifNotNil: [ self tpDsp init ] ] value ifNotNil: [ self tpDsp start ] ] fork.

	tpPerf := perf forDsp: tpDsp
]
