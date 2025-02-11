"
# DX7 algorithms. 
## Implements the 32 DX7 algorithms. 
[More about operators and algorythms here](https://djjondent.blogspot.com/2019/10/yamaha-dx7-algorithms.html).
Very good information about the DX7 Synthesiszer on profrssor [Dave Benson website](https://yamahablackboxes.com/collection/yamaha-dx7-synthesizer/).
Each algorithm uses 6 operators.
Here the parameters:
Where:

**algoNumber**: algorithm number (0-31, should be an int...)
**egRates1**: preset envelope rates 1 (a list of 6 values between 0-99)
**egRates2**: preset envelope rates 2 (a list of 6 values between 0-99)
**egRates3**: preset envelope rates 3 (a list of 6 values between 0-99)
**egRates4**: preset envelope rates 4 (a list of 6 values between 0-99)
**egLevels1**: preset envelope levels 1 (a list of 6 values between 0-99)
**egLevels2**: preset envelope levels 2 (a list of 6 values between 0-99)
**egLevels3**: preset envelope levels 3 (a list of 6 values between 0-99)
**egLevels4**: preset envelope levels 4 (a list of 6 values between 0-99)
**outLevels**: preset output levels (a list of 6 values between 0-99)
**keyVelocities**: preset key velocity sensitivities (a list of 6 values between 0-99)
**ampModSensitivities**: preset amplitude sensitivities (a list of 6 values between 0-99)
**opModes**: preset operator mode (a list of 6 values between 0-1)
**opFrequencies**: preset operator frequencies (a list of 6 values between 0-99)
**opDetunes**: preset operator detuning (a list of 6 values between 0-99)
**opRateScale**: preset operator rate scale (a list of 6 values between 0-99)
**feedbacks**: preset operator feedback (a list of 6 values between 0-99)
**lfoDelays**: preset LFO delay (a list of 6 values between 0-99)
**lfoDepths**: preset LFO depth (a list of 6 values between 0-99)
**lfoSpeeds**: preset LFO speed (a list of 6 values between 0-99)
**freq**: fundamental frequency
**gain**: general gain
**gate**: trigger signal
"
Class {
	#name : 'Dx7Algo',
	#superclass : 'UnitGenerator',
	#instVars : [
		'lfoDepths',
		'freq',
		'gain',
		'egLevels4',
		'opRateScales',
		'feedbacks',
		'egRates3',
		'outLevels',
		'egRates1',
		'opModes',
		'algoNumber',
		'keyVelocitiess',
		'ampModSensitivities',
		'egRates4',
		'lfoSpeeds',
		'gate',
		'egLevels2egLevels3',
		'egRates2',
		'egLevels1',
		'lfoDelays',
		'opDetunes'
	],
	#category : 'Phausto-Dx7',
	#package : 'Phausto',
	#tag : 'Dx7'
}

{ #category : 'initialization' }
Dx7Algo >> initialize [

super initialize .
processExpression := 'process = dx.dx7_Algo;'
]
