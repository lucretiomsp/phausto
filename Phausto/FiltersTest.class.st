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

	self deny: PhOneZero new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testPhApnl [

	self deny: PhApnl new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhAvgRect [

	self deny: PhAvgRect new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhAvgT19 [

	self deny: PhAvgT19 new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhAvgT60 [

	self deny: PhAvgT60 new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhAvgTau [

	self deny: PhAvgTau new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhBandPass [

	self deny: PhBandPass new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhBandPass12e [

	self deny: PhBandPass12e new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhBandPass6e [

	self deny: PhBandPass6e new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhBandPass6eSetEdges [

	self deny: (PhBandPass6e new
			 fl: 500;
			 fu: 2000;
			 yourself) stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhBandStop [

	self deny: PhBandStop new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhCrossover2LR4 [

	self deny: PhCrossover2LR4 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhCrossover3LR4 [
	"3 outputs: cannot be split to stereo"

	self deny: PhCrossover3LR4 new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhCrossover4LR4 [
	"4 outputs: cannot be split to stereo"

	self deny: PhCrossover4LR4 new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhCrossover8LR4 [
	"8 outputs: cannot be split to stereo"

	self deny: PhCrossover8LR4 new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhDynamicSmoothing [

	self deny: PhDynamicSmoothing new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhFIR [

	self deny: PhFIR new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhFIRCoefficients [

	| fir |
	fir := PhFIR new coefficients: #( 0.1 0.2 0.4 0.2 0.1 ).
	self assert: fir processExpression equals: 'process = fi.fir((0.1,0.2,0.4,0.2,0.1));'.
	self deny: fir stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighPass3e [

	self deny: PhHighPass3e new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighPass3eSetCutoff [

	self deny: (PhHighPass3e new
			 cutoff: 300;
			 yourself) stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighPass6e [

	self deny: PhHighPass6e new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighPassLR4 [

	self deny: PhHighPassLR4 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighPassMinusLowPass [

	self deny: PhHighPassMinusLowPass new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighPassPlusLowPass [

	self deny: PhHighPassPlusLowPass new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighShelf [

	self deny: PhHighShelf new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighShelf1 [

	self deny: PhHighShelf1 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhHighShelf1L [

	self deny: PhHighShelf1L new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhIIR [

	self deny: PhIIR new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhIntegrator [

	self deny: PhIntegrator new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhKFilter [

	self deny: PhKFilter new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLevelFilter [

	self deny: PhLevelFilter new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLevelFilterN [

	self deny: PhLevelFilterN new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLowPass3e [

	self deny: PhLowPass3e new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLowPass6e [

	self deny: PhLowPass6e new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLowPassLR4 [

	self deny: PhLowPassLR4 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLowShelf [

	self deny: PhLowShelf new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testPhLowShelf1 [

	self deny: PhLowShelf1 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLowShelf1L [

	self deny: PhLowShelf1L new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLpT19 [

	self deny: PhLpT19 new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhLpT60 [

	self deny: PhLpT60 new asDsp isNull
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
FiltersTest >> testPhNlf2 [

	self deny: PhNlf2 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhNotchW [

	self deny: PhNotchW new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhOneEuro [

	self deny: PhOneEuro new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhPeakEq [

	self deny: PhPeakEq new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhPeakEqCq [

	self deny: PhPeakEqCq new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhPeakEqRm [

	self deny: PhPeakEqRm new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhPole [

	self deny: PhPole new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testPhPoleProcessExpression [

	self assert: PhPole new processExpression equals: 'process = fi.pole;'
]

{ #category : 'tests' }
FiltersTest >> testPhPosPass [

	self deny: PhPosPass new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhPosPass6e [

	self deny: PhPosPass6e new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhRev1 [

	self deny: PhRev1 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhRev2 [

	self deny: PhRev2 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSpectralTilt [

	self deny: PhSpectralTilt new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfAp [

	self deny: PhSvfAp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfBell [

	self deny: PhSvfBell new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfBellSetGain [

	self deny: (PhSvfBell new
			 gain: -6;
			 frequency: 800;
			 yourself) stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfBp [

	self assert: PhSvfBp new processExpression equals: 'process = fi.svf.bp;'.
	self deny: PhSvfBp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfHs [

	self deny: PhSvfHs new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfLs [

	self deny: PhSvfLs new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfMorph [

	self deny: PhSvfMorph new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfNotchMorph [

	self deny: PhSvfNotchMorph new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfTptAp [

	self deny: PhSvfTptAp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfTptBp [

	self deny: PhSvfTptBp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfTptBpNorm [

	self deny: PhSvfTptBpNorm new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfTptHp [

	self deny: PhSvfTptHp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfTptLp [

	self deny: PhSvfTptLp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfTptNotch [

	self deny: PhSvfTptNotch new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhSvfTptPeaking [

	self deny: PhSvfTptPeaking new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf1 [

	self deny: PhTf1 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf1s [

	self deny: PhTf1s new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf1sb [

	self deny: PhTf1sb new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf1snp [

	self deny: PhTf1snp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf2 [

	self deny: PhTf2 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf21 [

	self deny: PhTf21 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf21t [

	self deny: PhTf21t new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf22 [

	self deny: PhTf22 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf22t [

	self deny: PhTf22t new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf2np [

	self deny: PhTf2np new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf2s [

	self deny: PhTf2s new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf2sb [

	self deny: PhTf2sb new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf2snp [

	self deny: PhTf2snp new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf3 [

	self deny: PhTf3 new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhTf3slf [

	self deny: PhTf3slf new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhWgr [

	self deny: PhWgr new stereo asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testPhZero [

	self deny: PhZero new asDsp isNull
]

{ #category : 'tests' }
FiltersTest >> testResonBp [

	self deny: PhResonBp new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testResonHp [

	self deny: PhResonHp new asDsp isNull 
]

{ #category : 'tests' }
FiltersTest >> testResonLp [

	self deny: PhResonLp new asDsp isNull
]
