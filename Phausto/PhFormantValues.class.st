"
Formant data values in an environment.
The formant data used here come from the CSOUND manual <http://www.csounds.com/manual/html/>.

Faust: `pm.formantValues(parameter, i, j)` (0 in / 1 out)

## Parameters

- **parameter**: 'f' (frequency), 'g' (gain) or 'bw' (bandwidth)
- **formant**: formant number _(compile-time constant: give me a Number)_
- **index**: (voiceType*nFormants)+vowel _(compile-time constant: give me a Number)_

## Example

```language=Pharo
dsp := PhFormantValues new stereo asDsp.
dsp init.
dsp start.
```
"
Class {
	#name : 'PhFormantValues',
	#superclass : 'FormantSynthesis',
	#instVars : [
		'parameter',
		'formant',
		'index'
	],
	#category : 'Phausto-PhysModels - Vocal Synthesis',
	#package : 'Phausto',
	#tag : 'PhysModels - Vocal Synthesis'
}

{ #category : 'faust' }
PhFormantValues class >> argumentDescriptions [

	^ Dictionary newFrom: {
			#parameter -> '''f'' (frequency), ''g'' (gain) or ''bw'' (bandwidth)'.
			#formant -> 'formant number'.
			#index -> '(voiceType*nFormants)+vowel' }
]

{ #category : 'faust' }
PhFormantValues class >> argumentNames [

	^ #( #parameter #formant #index )
]

{ #category : 'faust' }
PhFormantValues class >> faustName [

	^ 'formantValues'
]

{ #category : 'faust' }
PhFormantValues >> faustCall [

	"formantValues is an environment of lists (f, g, bw): I pick the value at index (j = voiceType * nFormants + vowel) of formant i"

	^ 'ba.take(' , index asFaustArgument , ' + 1, pm.formantValues.' , parameter , '(' , formant asFaustArgument , '))'
]

{ #category : 'accessing' }
PhFormantValues >> formant [

	^ formant
]

{ #category : 'accessing' }
PhFormantValues >> formant: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'accessing' }
PhFormantValues >> index [

	^ index
]

{ #category : 'accessing' }
PhFormantValues >> index: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]

{ #category : 'initialization' }
PhFormantValues >> initializeArguments [

	parameter := 'f'.
	formant := 0.
	index := 0
]

{ #category : 'accessing' }
PhFormantValues >> parameter [

	^ parameter
]

{ #category : 'accessing' }
PhFormantValues >> parameter: aNumberOrABoxOrASymbol [

	<paramSetter>
	self paramSetter value: aNumberOrABoxOrASymbol
]
