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

	self deny: Pulse new asDsp isNull 
]

{ #category : 'tests' }
BasicCountersTest >> testPulseCountDownLoopAsDsp [

	self assert: PulseCountDownLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPulseCountUpLoopAsDsp [

	self assert: PulseCountUpLoop new asDsp isNull equals: false
]

{ #category : 'tests' }
BasicCountersTest >> testPulsenAsDsp [

	self deny: Pulsen new asDsp isNull 
]

{ #category : 'tests' }
BasicCountersTest >> testResetCtrAsDsp [

	self assert: PhResetCtr new asDsp isNull equals: false
]
