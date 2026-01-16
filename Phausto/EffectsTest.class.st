Class {
	#name : 'EffectsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
EffectsTest >> TODOtestVitalRevDemoAsDsp [

	"new version of faust libs must be bundled to pass this test"
	self assert: Vital_Rev_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testCMoogVCFDemoDemoAsDsp [

	self assert: Moog_Vcf_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testCompressorDemoAsDsp [

	self assert: Compressor_Demo new asDsp isNull equals: false
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

	self assert: Dattorro_Rev_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testDryWetMonoMixerAsDsp [

	self deny: DryWetMonoMixer new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testExciterDemoAsDsp [


	self assert: Exciter_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testFlangerDemoAsDsp [

	self assert: Flanger_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testFractionalDelayAsDsp [

	self assert: FractionalDelay new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testFreeverbDemoAsDsp [

	self assert: Freeverb_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testFreeverbMonoAsDsp [

	self assert: FreeverbMono new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testGateDemoAsDsp [

	self assert: Gate_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testGreyHoleAsDsp [

	self assert: GreyHole new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testGreyHoleDemoAsDsp [

	self assert: GreyHole_Demo new asDsp isNull equals: false
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

	self assert: Parametric_Eq_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testPhTranssposeDsp [


	self assert: PhTranspose new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testPhVocoderDsp [


	self assert: Vocoder_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testPhaser2DemoAsDsp [

	self assert: Phaser2_Demo new asDsp isNull equals: false
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
EffectsTest >> testTapeStopDemoAsDsp [
	"new version of faust libs must be bundled to pass this test"

	self deny: TapeStop_Demo new asDsp isNull 
]

{ #category : 'tests' }
EffectsTest >> testVelvetNoiseDemoAsDsp [

	self assert: Velvet_Noise_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testVirtualAnalogOscillatorDemoAsDsp [

	self assert: Virtual_Analog_Oscillator_Demo new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testWah4DemoAsDsp [

	self assert: Wah4_Demo new asDsp isNull equals: false
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

	self assert: Zita_Light new asDsp isNull equals: false
]

{ #category : 'tests' }
EffectsTest >> testZitaRevAsDsp [

	self deny:  ZitaRevStereo new asDsp isNull 
]
