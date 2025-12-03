Class {
	#name : 'BasicCountersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicCountersTest >> testCountDownAsDsp [

	self assert: PhCountDown new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testCountUpAsDsp [

	self assert: PhCountUp new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testCounterAsDsp [

	self assert: Counter new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPhBeatAsDsp [

	self deny: PhBeat new asDsp isNull
]

{ #category : 'tests' }
BasicCountersTest >> testPhCycleAsDsp [
	"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PhCycle new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicCountersTest >> testPhLineAsDsp [

	self assert: PhLine  new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPhPeriodAsDsp [

	self assert: PhPeriod  new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPhRampAsDsp [

	self assert: PhRamp new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPhTempoAsDsp [

	self deny: PhTempo new asDsp isNull 
]

{ #category : 'tests' }
BasicCountersTest >> testPhTimeAsDsp [

	self assert: PhTime new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPulseAsDsp [

	self assert: Pulse new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPulseCountDownAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PulseCountDown new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicCountersTest >> testPulseCountDownLoopAsDsp [

	self assert: PulseCountDownLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPulseCountUpAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PulseCountUp new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicCountersTest >> testPulseCountUpLoopAsDsp [

	self assert: PulseCountUpLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPulsenAsDsp [

	self assert: Pulsen new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testResetCtrAsDsp [

	self assert: PhResetCtr new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testSpulsedAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0

	"self assert: Sweep new asDsp isNull equals: false"
]
