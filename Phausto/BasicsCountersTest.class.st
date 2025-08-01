Class {
	#name : 'BasicsCountersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicsCountersTest >> testCountDownAsDsp [

	self assert: PhCountDown new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testCountUpAsDsp [

	self assert: PhCountUp new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testCounterAsDsp [

	self assert: Counter new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPhBeatAsDsp [

	self assert: PhBeat new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPhCycleAsDsp [
	"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PhCycle new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicsCountersTest >> testPhLineAsDsp [

	self assert: PhLine  new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPhPeriodAsDsp [

	self assert: PhPeriod  new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPhRampAsDsp [

	self assert: PhRamp new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPhTempoAsDsp [

	self assert: PhTempo new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPhTimeAsDsp [

	self assert: PhTime new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPulseAsDsp [

	self assert: Pulse new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPulseCountDownAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PulseCountDown new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicsCountersTest >> testPulseCountDownLoopAsDsp [

	self assert: PulseCountDownLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPulseCountUpAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0
	"self assert: PulseCountUp new asDsp isNull equals: false"
]

{ #category : 'tests' }
BasicsCountersTest >> testPulseCountUpLoopAsDsp [

	self assert: PulseCountUpLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testPulsenAsDsp [

	self assert: Pulsen new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testResetCtrAsDsp [

	self assert: PhResetCtr new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicsCountersTest >> testSpulsedAsDsp [

"crash apparently for unexplicable reason"

	self assert: 1 equals: 0

	"self assert: Sweep new asDsp isNull equals: false"
]
