"
Down sample a signal. WARNING: this function doesn't change the rate of a signal, it just holds samples.

##Parameteres:
**freq:** new rate in Hz
"
Class {
	#name : 'PhDownSamplerCV',
	#superclass : 'PhBasics',
	#instVars : [
		'amount'
	],
	#category : 'Phausto-Basics',
	#package : 'Phausto',
	#tag : 'Basics'
}

{ #category : 'accessing' }
PhDownSamplerCV >> amount [ 
^ amount
]

{ #category : 'converting' }
PhDownSamplerCV >> asBox [ 

^ self amount asBox , self input asBox.
]

{ #category : 'initialization' }
PhDownSamplerCV >> initialize [

	super initialize.
	processExpression := 'process = ba.downSampleCV;'.
	input := 0.
	amount := 1.
]

{ #category : 'accessing' }
PhDownSamplerCV >> input [ 
^ input
]
