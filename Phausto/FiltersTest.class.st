Class {
	#name : 'FiltersTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
FiltersTest >> testAllPass_comb [

	self assert: Allpass_Comb new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testAllPass_fcomb [

	self assert: Allpass_FComb new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testAllPass_fcomb1a [

	self assert: Allpass_FComb1a new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testAllPass_fcomb5 [

	self assert: Allpass_FComb5 new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testDcBlocker [

	self assert: DcBlocker new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testDcBlockerAt [

	self assert: DcBlockerAt new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testDiodeLadder [

	self assert: DiodeLadder new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFbCombFilter [

	self assert: FbCombFilter new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFb_Comb [

	self assert: Fb_Comb new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFb_FComb [

	self assert: Fb_FComb new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFb_FCombFilter [

	self assert:Object new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFfCombFilter [

	self assert: FfCombFilter new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFf_Comb [

	self assert: Ff_Comb new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFf_FComb [

	self assert: Ff_FComb new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testFfbCombFilter [

	self assert: FfbCombFilter new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testIntegrator [

	self assert: Integrator new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testLowPassFilter [

self assert: Lowpass new  asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testLptN [

	self assert: LptN new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testMoogVcf [

self assert: MoogVcf new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testOneZero [

	self assert: OneZero new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testPole [

	self assert: Pole new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testResonBp [

self assert: ResonBp new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testResonHp [

self assert: ResonHp new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testResonLp [

self assert: ResonLp new asDsp isNull equals: false
]
