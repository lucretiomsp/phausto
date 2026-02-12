Class {
	#name : 'EffectsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
EffectsTest >> testCMoogVCFDemoDemoAsDsp [

	self deny: Moog_Vcf_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testCompressorDemoAsDsp [

	self deny: Compressor_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testCryBabyAsDsp [

	self assert: CryBaby new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testCubicNlAsDsp [

	self assert: CubicNl new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testDatorroRevDemoAsDsp [

	self deny: DattorroRev_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testDryWetMonoMixerAsDsp [

	self deny: DryWetMonoMixer new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testEnvelopesDemoAsDsp [

	self deny: Envelopes_Demo new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testExciterDemoAsDsp [

	self deny: Exciter_Demo new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testFlangerDemoAsDsp [

	self deny: Flanger_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testFractionalDelayAsDsp [

	self assert: FractionalDelay new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testFreeverbDemoAsDsp [

	self deny: Freeverb_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testFreeverbMonoAsDsp [

	self assert: FreeverbMono new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testGateDemoAsDsp [

	self deny: Gate_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testGreyHoleAsDsp [

	self deny: GreyHole new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testGreyHoleDemoAsDsp [

	self deny: GreyHole_Demo new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testKbRomRev1AsDsp [

	self deny: KbRomRev1 new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testLatchDemoAsDsp [

	self deny: Latch_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testOScrsDemoAsDsp [

	self assert: Oscrs_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testPannerAsDsp [

	self assert: Panner new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testParametricEQDemoAsDsp [

	self deny: Parametric_Eq_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testPhFibonacciAsDsp [

	self deny: PhFibonacci new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testPhTranssposeDsp [


	self assert: PhTranspose new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testPhVocoderDsp [

	self deny: Vocoder_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testPhaser2DemoAsDsp [

	self assert: Phaser2_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testReverseEchoDemoAsDsp [

	self deny: Reverse_Echo_Demo new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testSatRevAsDsp [

	self assert: SatRev new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testSawtoohDemoAsDsp [

	self assert: Sawtooth_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testSimpleDelayAsDsp [

	self assert: SimpleDelay new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testSineOscAsDsp [

	self assert: PhClip new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testSmoothDelayAsDsp [

	self assert: SmoothDelay new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testSoftClipQaudraticAsDsp [

	self assert: SoftClipQuadratic new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testSpectralTiltDemoAsDsp [

	self deny: Spectral_Tilt_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testTapeStopDemoAsDsp [
	"new version of faust libs must be bundled to pass this test"

	self deny: TapeStop_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testTwinOScDemoAsDsp [
	
	self deny: Twin_Osc_Demo new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testVelvetNoiseDemoAsDsp [

	self deny: Velvet_Noise_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testVirtualAnalogOscillatorDemoAsDsp [

	self assert: Virtual_Analog_Oscillator_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testVitalRevDemoAsDsp [
	"new version of faust libs must be bundled to pass this test"

	self deny: VitalRev_Demo new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testWah4DemoAsDsp [

	self deny:  Wah4_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testWahAsDsp [

	self assert: Wah new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testWavefoldAsDsp [

	self assert: Wavefold new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testZitaLighDemoAsDsp [

	self deny: ZitaLight new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testZitaRev1AsDsp [

	self deny: ZitaRev1 new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testZitaRevAsDsp [

	self deny:  ZitaRevStereo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testZitaRevFdnAsDsp [

	self deny: ZitaRevFdn new asDsp isNull
]

{ #category : 'tests' }
EffectsTest >> testZitaRevPatchedWith [

| rev |
rev := SquareOsc new => ZitaRevStereo new .
	self deny: rev  asDsp isNull
]
