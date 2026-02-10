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

	self deny: PhDcBlockerAt new asDsp isNull 
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

	self assert: FbCombFilter new asDsp isNull equals: false
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
FiltersTest >> testKorg35HPF [

	self deny: Korg35HPF new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testKorg35LPF [

	self deny: Korg35LPF new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testLowPassFilter [

	self deny: Lowpass new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testLptN [

	self assert: LptN new asDsp isNull equals: false
]

{ #category : 'tests' }
FiltersTest >> testMoogHalfLadder [

	self deny: MoogHalfLadder new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testMoogLadder [

	self deny: MoogLadder new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testMoogVcf [

	self deny: MoogVcf new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testOberheim [

	self deny: Oberheim new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testOberheimBPF [

	self deny: OberheimBPF new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testOberheimBSF [

	self deny: OberheimBSF new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testOberheimHPF [

	self deny: OberheimHPF new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testOberheimLPF [

	self deny: OberheimLPF new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testOneZero [

	self deny: OneZero new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testPHIntegrator [

	self deny: PhIntegrator new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLpTau [

	self deny: PhLpTau new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLpTauChangeTN [

	self deny: (PhLpTau new tN: 0.8) asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLptN [

	self deny: PhLptN new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPole [

	self deny: Pole new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testResonBp [

	self deny: ResonBp new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testResonHp [

	self deny: ResonHp new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testResonLp [

	self deny: ResonLp new asDsp isNull
]
