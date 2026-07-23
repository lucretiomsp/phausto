"
##DX7 Operator. 
Implements a phase-modulable sine wave oscillator connected to a DX7 envelope generator.

##Parameters

**freq**: frequency of the oscillator
**phaseMod**: phase deviation (-1 - 1)
**outLevel**: preset output level (0-99)
**egRate1**: preset envelope rate 1 (0-99)
**egRate2**: preset envelope rate 2 (0-99)
**egRate3**: preset envelope rate 3 (0-99)
**egRate4**: preset envelope rate 4 (0-99)
**egLevel1** preset envelope level 1 (0-99)
**egLevel2**: preset envelope level 2 (0-99)
**egLevel3**: preset envelope level 3 (0-99)
**egLevel4**: preset envelope level 4 (0-99)
**keyVelovity**: preset key velocity sensitivity (0-99)
**rateScale**: preset envelope rate scale
**type**: preset operator type
**gain**: general gain
g**ate**: trigger signal

"
Class {
	#name : 'Dx7Op',
	#superclass : 'UnitGenerator',
	#instVars : [
		'mode',
		'freqCoarse',
		'freqFine',
		'detune',
		'outLevel',
		'egRate1',
		'egRate2',
		'egRate3',
		'egRate4',
		'egLevel1',
		'egLevel2',
		'egLevel3',
		'egLevel4',
		'keyVelSens',
		'ampModSens',
		'rateScale',
		'breakpoint',
		'breakpointLDepth',
		'breakpointRDepth',
		'breakpointLCurve',
		'breakpointRCurve',
		'lfoWave',
		'lfoSpeed',
		'lfoDelay',
		'lfoPMD',
		'lfoAMD',
		'lfoSync',
		'lfoPitchModSens',
		'oscKeySync',
		'pitchEgRate1',
		'pitchEgRate2',
		'pitchEgRate3',
		'pitchEgRate4',
		'pitchEgLevel1',
		'pitchEgLevel2',
		'pitchEgLevel3',
		'pitchEgLevel4',
		'transpose',
		'phaseMod',
		'baseFreq',
		'gain',
		'gate'
	],
	#category : 'Phausto-Dx7',
	#package : 'Phausto',
	#tag : 'Dx7'
}

{ #category : 'accessing' }
Dx7Op >> ampModSens [

	^ ampModSens
]

{ #category : 'accessing' }
Dx7Op >> ampModSens: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
Dx7Op >> asBox [
^ self mode , self freqCoarse , self freqFine , self detune
	   , self outLevel
	   , self egRate1 , self egRate2 , self egRate3 , self egRate4
	   , self egLevel1 , self egLevel2 , self egLevel3 , self egLevel4
	   , self keyVelSens , self ampModSens , self rateScale
	   , self breakpoint , self breakpointLDepth , self breakpointRDepth
	   , self breakpointLCurve , self breakpointRCurve
	   , self lfoWave , self lfoSpeed , self lfoDelay
	   , self lfoPMD , self lfoAMD , self lfoSync , self lfoPitchModSens
	   , self oscKeySync
	   , self pitchEgRate1 , self pitchEgRate2 , self pitchEgRate3 , self pitchEgRate4
	   , self pitchEgLevel1 , self pitchEgLevel2 , self pitchEgLevel3 , self pitchEgLevel4
	   , self transpose
	   , self phaseMod , self baseFreq , self gain , self gate	connectTo: self code asBox
]

{ #category : 'accessing' }
Dx7Op >> baseFreq [ 

^ baseFreq
]

{ #category : 'accessing' }
Dx7Op >> baseFreq: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol 

]

{ #category : 'accessing' }
Dx7Op >> breakpoint [

	^ breakpoint
]

{ #category : 'accessing' }
Dx7Op >> breakpoint: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> breakpointLCurve [

	^ breakpointLCurve
]

{ #category : 'accessing' }
Dx7Op >> breakpointLCurve: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> breakpointLDepth [

	^ breakpointLDepth
]

{ #category : 'accessing' }
Dx7Op >> breakpointLDepth: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> breakpointRCurve [

	^ breakpointRCurve
]

{ #category : 'accessing' }
Dx7Op >> breakpointRCurve:aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> breakpointRDepth [

	^ breakpointRDepth
]

{ #category : 'accessing' }
Dx7Op >> breakpointRDepth: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> detune [

	^ detune
]

{ #category : 'accessing' }
Dx7Op >> detune: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egLevel1 [

	^ egLevel1
]

{ #category : 'accessing' }
Dx7Op >> egLevel1: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egLevel2 [

	^ egLevel2
]

{ #category : 'accessing' }
Dx7Op >> egLevel2:aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egLevel3 [

	^ egLevel3
]

{ #category : 'accessing' }
Dx7Op >> egLevel3: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egLevel4 [

	^ egLevel4
]

{ #category : 'accessing' }
Dx7Op >> egLevel4: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egRate1 [

	^ egRate1
]

{ #category : 'accessing' }
Dx7Op >> egRate1: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egRate2 [

	^ egRate2
]

{ #category : 'accessing' }
Dx7Op >> egRate2: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egRate3 [

	^ egRate3
]

{ #category : 'accessing' }
Dx7Op >> egRate3: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> egRate4 [

	^ egRate4
]

{ #category : 'accessing' }
Dx7Op >> egRate4: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> freqCoarse [

	^ freqCoarse
]

{ #category : 'accessing' }
Dx7Op >> freqCoarse: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> freqFine [

	^ freqFine
]

{ #category : 'accessing' }
Dx7Op >> freqFine: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> gain [

	^ gain
]

{ #category : 'accessing' }
Dx7Op >> gain: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> gate [

	^ gate
]

{ #category : 'accessing' }
Dx7Op >> gate: anObject [

	gate := anObject
]

{ #category : 'initialization' }
Dx7Op >> initialize [

	super initialize.
	importStatement := 'op = library("operator.lib");'.
	processExpression := 'process = op.operator;'.
	self initializeEgLevels.
	self initializeEgRates.
	self initializeMiscParameters.
	self initializeBreakPoints.
	self initializeLfos .
	baseFreq := PhHSlider new
		            label: self label , 'Freq'
		            values: #( 440 20 900 0.1 )
]

{ #category : 'initialization' }
Dx7Op >> initializeBreakPoints [


	breakpointLDepth := PhHSlider new
		           label: self label , 'bPointDepthL'
		           values: #( 0 0 99 1 ).
	breakpointRDepth := PhHSlider new
		           label: self label , 'bPointDepthR'
		           values: #( 0 0 99 1 ).
		breakpointLCurve := PhNumEntry new
		           label: self label , 'bPointCurveL'
		           values: #( 0 0 3 1 ).
			breakpointRCurve := PhNumEntry new
		           label: self label , 'bPointCurveR'
		           values: #( 0 0 3 1 ).
	
	
]

{ #category : 'initialization' }
Dx7Op >> initializeControlParameters [

	| g |
	super initializeControlParameters.

	g := #gate -> (PhControlParameter new
		      label: #gate;
		      description: 'Gate trigger';
		      min: 0;
		      max: 1;
		      value: self gate;
		      widgetType: #button).
		
	self controlParameters add: g
]

{ #category : 'initialization' }
Dx7Op >> initializeEgLevels [

	outLevel := PhHSlider new
		            label: self label , 'OutLevel'
		            values: #( 90 0 99 1 ).
	egLevel1 := PhHSlider new
		            label: self label , 'L1'
		            values: #(99 0 99 1 ).
	egLevel2 := PhHSlider new
		            label: self label , 'L2'
		            values: #( 88 0 99 1 ).
	egLevel3 := PhHSlider new
		            label: self label , 'L3'
		            values: #( 96 0 99 1 ).
	egLevel4 := PhHSlider new
		            label: self label , 'L4'
		            values: #( 0 0 99 1 )
]

{ #category : 'initialization' }
Dx7Op >> initializeEgRates [

	rateScale := PhHSlider new
		             label: self label , 'RateScale'
		             values: #( 0 0 9 1 ).
	egRate1 := PhHSlider new
		           label: self label , 'R1'
		           values: #( 72 0 99 1 ).
	egRate2 := PhHSlider new
		           label: self label , 'R2'
		           values: #( 75 0 99 1 ).
	egRate3 := PhHSlider new
		           label: self label , 'R3'
		           values: #( 49 0 99 1 ).
	egRate4 := PhHSlider new
		           label: self label , 'R4'
		           values: #( 71 0 99 1 )
]

{ #category : 'initialization' }
Dx7Op >> initializeLfos [

	lfoWave := PhNumEntry new
		           label: self label , 'LfoWave'
		           values: #( 0 0 5 1 ).
	lfoSpeed := PhHSlider new
		            label: self label , 'LfoSpeed'
		            values: #( 0 0 99 1 ).
	lfoDelay := PhHSlider new
		            label: self label , 'LfoDelay'
		            values: #( 0 0 99 1 ).
	lfoAMD := lfoSpeed := PhHSlider new
		                      label: self label , 'LfoAMD'
		                      values: #( 0 0 99 1 ).
	lfoPitchModSens := PhNumEntry new
		                   label: self label , 'LfoWave'
		                   values: #( 0 0 7 1 )
]

{ #category : 'initialization' }
Dx7Op >> initializeMiscParameters [

	mode := PhNumEntry new
		        label: self label , 'Mode'
		        values: #( 0 0 1 1 ).
	oscKeySync := PhNumEntry new
		              label: self label , 'OscKeySync'
		              values: #( 0 0 1 1 ).
	gate := PhButton new label: self label , 'Gate'.
	gain := PhHSlider new
		        label: self label , 'Gain'
		        values: #( 0.5 0 1 0.001 ).
	keyVelSens := PhHSlider new
		              label: self label , 'KeyVel'
		              values: #( 0 0 99 1 ).
	phaseMod := 0 asBox.
	transpose := PhHSlider new
		        label: self label , 'Transpose'
		        values: #( 0 -12 12 1 ).
]

{ #category : 'accessing' }
Dx7Op >> keyVelSens [

	^ keyVelSens
]

{ #category : 'accessing' }
Dx7Op >> keyVelSens: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> lfoAMD [

	^ lfoAMD
]

{ #category : 'accessing' }
Dx7Op >> lfoAMD: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> lfoDelay [

	^ lfoDelay
]

{ #category : 'accessing' }
Dx7Op >> lfoDelay: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> lfoPMD [

	^ lfoPMD
]

{ #category : 'accessing' }
Dx7Op >> lfoPMD: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> lfoPitchModSens [

	^ lfoPitchModSens
]

{ #category : 'accessing' }
Dx7Op >> lfoPitchModSens: anObject [

	lfoPitchModSens := anObject
]

{ #category : 'accessing' }
Dx7Op >> lfoSpeed [

	^ lfoSpeed
]

{ #category : 'accessing' }
Dx7Op >> lfoSpeed: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> lfoSync [

	^ lfoSync
]

{ #category : 'accessing' }
Dx7Op >> lfoSync: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> lfoWave [

	^ lfoWave
]

{ #category : 'accessing' }
Dx7Op >> lfoWave: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> mode [

	^ mode
]

{ #category : 'accessing' }
Dx7Op >> mode: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> oscKeySync [

	^ oscKeySync
]

{ #category : 'accessing' }
Dx7Op >> oscKeySync: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> outLevel [

	^ outLevel
]

{ #category : 'accessing' }
Dx7Op >> outLevel: anObject [

	outLevel := anObject
]

{ #category : 'accessing' }
Dx7Op >> phaseMod [

	^ phaseMod
]

{ #category : 'accessing' }
Dx7Op >> phaseMod: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel1 [

	^ pitchEgLevel1
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel1: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel2 [

	^ pitchEgLevel2
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel2: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel3 [

	^ pitchEgLevel3
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel3: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel4 [

	^ pitchEgLevel4
]

{ #category : 'accessing' }
Dx7Op >> pitchEgLevel4: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate1 [

	^ pitchEgRate1
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate1: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate2 [

	^ pitchEgRate2
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate2: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate3 [

	^ pitchEgRate3
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate3: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate4 [

	^ pitchEgRate4
]

{ #category : 'accessing' }
Dx7Op >> pitchEgRate4: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> rateScale [

	^ rateScale
]

{ #category : 'accessing' }
Dx7Op >> rateScale: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
Dx7Op >> transpose [

	^ transpose
]

{ #category : 'accessing' }
Dx7Op >> transpose: aNumberOrABoxOrASymbol [

<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
