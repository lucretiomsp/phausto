Class {
	#name : 'BasiConvertersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasiConvertersTest >> testCent2RatioAsDsp [

	self deny: PhCent2Ratio new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testDb2Linear [

	self deny: PhDb2Linear new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testHz2MidiKeyAsDsp [

	self deny: PhHz2MidiKey new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testLinea2LogGainAsDsp [

	self deny: PhLinear2LogGain new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testLinear2dB [ 

	self deny: PhLinear2Db new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testLog2LinearGainAsDsp [

	self deny: PhLog2LinearGain new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testPhHz2PianoKeyAsDsp [

	self deny: PhHz2PianoKey new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testPhMidiKey2HzAsDsp [

	self deny: PhMidiKey2Hz new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testPhPole2TaueAsDsp [

	self deny: PhPole2tau new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testPhTau2PoleAsDsp [

	self deny: PhTau2Pole new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testPianoKey2HzAsDsp [

	self deny: PhPianoKey2Hz new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testRatio2CentAsDsp [
 self deny: 1 isNumber . 
	self deny: PhRatio2Cent new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testRatio2SemitoneAsDsp [


self deny: 1 == 1.
	"self deny: PhRatio2Semitone new asDsp isNull"
]

{ #category : 'tests' }
BasiConvertersTest >> testSamp2Sec [

self deny: PhSamp2Sec new asDsp isNull.
]

{ #category : 'tests' }
BasiConvertersTest >> testSec2Samples [ 

	self deny: PhSec2Samp new asDsp isNull
]

{ #category : 'tests' }
BasiConvertersTest >> testSemi2RatioAsDsp [

	
	self deny: PhSemi2Ratio new asDsp isNull
]
