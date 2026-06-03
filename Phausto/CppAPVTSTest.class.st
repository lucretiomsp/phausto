Class {
	#name : 'CppAPVTSTest',
	#superclass : 'TestCase',
	#instVars : [
		'exp',
		'json',
		'controls',
		'floatParam',
		'boolParam',
		'params'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'running' }
CppAPVTSTest >> setUp [ 
super setUp.
	floatParam := DSPParameter new
		shortName: 'Korg35HPFRes'; label: 'Korg35HPFRes';
		minValue: 1; maxValue: 8; stepValue: 0.001; initValue: 1;
		type: 'hslider'; address: '/MyApp/Korg35HPFRes'; yourself.
	boolParam := DSPParameter new
		shortName: 'Gate'; label: 'Gate';
		minValue: 0; maxValue: 1; stepValue: 1; initValue: 0;
		type: 'button'; address: '/MyApp/Gate'; yourself.
	params := { floatParam. boolParam }
]

{ #category : 'tests' }
CppAPVTSTest >> testCppFloatFormatsFloats [ 
	self assert: (DSP cppFloat: 0.3) equals: '0.3f'.
	self assert: (DSP cppFloat: 0.001) equals: '0.001f'
]

{ #category : 'tests' }
CppAPVTSTest >> testCppFloatFormatsIntegers [ 
	self assert: (DSP cppFloat: 1) equals: '1.0f'.
	self assert: (DSP cppFloat: 8) equals: '8.0f'.
	self assert: (DSP cppFloat: 0) equals: '0.0f'
]

{ #category : 'tests' }
CppAPVTSTest >> testEveryParamIdMatchesShortname [ 
	| push |
	push := DSP apvtsPushBodyFor: params.
	params do: [ :p |
		self assert: (push includesSubstring: 'getRawParameterValue ("' , p shortName , '")') ]

]

{ #category : 'tests' }
CppAPVTSTest >> testFromDictionaryCapturesAddress [ [
	| dict |
	dict := Dictionary new
		at: #label put: 'X'; at: #shortname put: 'X';
		at: #min put: 0; at: #max put: 1; at: #init put: 0.5;
		at: #type put: 'hslider'; at: #step put: 0.01;
		at: #address put: '/MyApp/X'; yourself.
	self assert: (DSPParameter fromDictionary: dict) address equals: '/MyApp/X'
]
]

{ #category : 'tests' }
CppAPVTSTest >> testLayoutEmitsBoolForButton [ 
	self assert: ((DSP apvtsLayoutBodyFor: params) includesSubstring:
		'std::make_unique<juce::AudioParameterBool> (juce::ParameterID { "Gate", 1 }, "Gate", false)')

]

{ #category : 'tests' }
CppAPVTSTest >> testLayoutEmitsFloatParameter [ [
	self assert: ((DSP apvtsLayoutBodyFor: params) includesSubstring:
		'std::make_unique<juce::AudioParameterFloat> (juce::ParameterID { "Korg35HPFRes", 1 }, "Korg35HPFRes", juce::NormalisableRange<float> (1.0f, 8.0f, 0.001f), 1.0f)')
]
]

{ #category : 'tests' }
CppAPVTSTest >> testOneLinePerParameter [ 
	| layout push |
	layout := (DSP apvtsLayoutBodyFor: params) lines select: [ :l | l includesSubstring: 'layout.add' ].
	push := (DSP apvtsPushBodyFor: params) lines select: [ :l | l includesSubstring: 'setParamValue' ].
	self assert: layout size equals: params size.
	self assert: push size equals: params size
]

{ #category : 'tests' }
CppAPVTSTest >> testPushUsesAddressAndId [ 
	self assert: ((DSP apvtsPushBodyFor: params) includesSubstring:
		'fUI->setParamValue ("/MyApp/Korg35HPFRes", apvts.getRawParameterValue ("Korg35HPFRes")->load())')

]
