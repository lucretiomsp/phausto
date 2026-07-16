Class {
	#name : 'BasicConvertersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicConvertersTest >> TODOtestRatio2CentAsDsp [
 self deny: 1 isNumber . 
	self deny: PhRatio2Cent new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testCent2RatioAsDsp [

	self deny: PhCent2Ratio new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testDb2Linear [

	self deny: PhDb2Linear new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testHz2MidiKeyAsDsp [

	self deny: PhHz2MidiKey new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testLinea2LogGainAsDsp [

	self deny: PhLinear2LogGain new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testLinear2dB [ 

	self deny: PhLinear2Db new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testLog2LinearGainAsDsp [

	self deny: PhLog2LinearGain new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testPhHz2PianoKeyAsDsp [

	self deny: PhHz2PianoKey new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testPhMidiKey2HzAsDsp [

	self deny: PhMidiKey2Hz new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testPhPole2TaueAsDsp [

	self deny: PhPole2tau new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testPhTau2PoleAsDsp [

	self deny: PhTau2Pole new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testPianoKey2HzAsDsp [

	self deny: PhPianoKey2Hz new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testRatio2SemitoneAsDsp [

	
	self deny: PhRatio2Semitone new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testSamp2Sec [

self deny: PhSamp2Sec new asDsp isNull.
]

{ #category : 'tests' }
BasicConvertersTest >> testSec2Samples [ 

	self deny: PhSec2Samp new asDsp isNull
]

{ #category : 'tests' }
BasicConvertersTest >> testSemi2RatioAsDsp [

	
	self deny: PhSemi2Ratio new asDsp isNull
]
