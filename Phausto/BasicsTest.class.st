Class {
	#name : 'BasicsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicsTest >> testCountDownAsDsp [

	self assert: CountDown new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testCountUpAsDsp [

	self assert: CountUp new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testCounterAsDsp [

	self assert: Counter new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testDownSamplerAsDsp [
	"crash apparently for unexplicable reason"

	self assert: 1 equals: 0.
	self assert: DownSampler new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testImpulsifyAsDsp [

	self assert: Impulsify new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhAutomatAsDsp [
	
	self assert: PhAutomat new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhBeatAsDsp [

	self assert: PhBeat new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhCycleAsDsp [
	"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PhCycle new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicsTest >> testPhLineAsDsp [

	self assert: PhLine  new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhPeriodAsDsp [

	self assert: PhPeriod  new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhRampAsDsp [

	self assert: PhRamp new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhTempoAsDsp [

	self assert: PhTempo new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPhTimeAsDsp [

	self assert: PhTime new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPulseAsDsp [

	self assert: Pulse new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPulseCountDownAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PulseCountDown new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicsTest >> testPulseCountDownLoopAsDsp [

	self assert: PulseCountDownLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPulseCountUpAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PulseCountUp new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicsTest >> testPulseCountUpLoopAsDsp [

	self assert: PulseCountUpLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testPulsenAsDsp [

	self assert: Pulsen new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testResetCtrAsDsp [

	self assert: ResetCtr new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testSampleAndHoldAsDsp [

	self assert: SampleAndHold new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testSelectNAsDsp [

	self assert: PhSelectN new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsTest >> testSpulsedAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0

	"self assert: Sweep new asDsp isNull equals: false"
]
