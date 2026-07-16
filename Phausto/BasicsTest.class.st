Class {
	#name : 'BasicsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
BasicsTest >> testDownSamplerAsDsp [

	self deny:  PhDownSampler new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testImpulsifyAsDsp [

	self deny: PhImpulsify new asDsp isNull 
]

{ #category : 'tests' }
BasicsTest >> testPhAutomatAsDsp [

| case |
case := PhAutomat new size: 8 asBox ; input: 1 asBox  ; init: 32 asBox.
	self deny: PhAutomat new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhBitCrusherAsDsp [

| case |
case := PhBitCrusher new nbits: 4.
	self deny: case  asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhDownSamplerAsDsp [

| case |
case := PhDownSampler new input: 1 asBox ; frequency: 123 asBox.
	self deny: case asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhDownSamplerCVAsDsp [

| case |
case := PhDownSamplerCV new input: 1 asBox ; amount: 0.3 asBox.
	self deny: case asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhKr2ArAsDsp [

| case |
case := PhKr2Ar new input: 1 asBox.
	self deny: case asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhLatchAsDsp [

	| case |
	case := PhLatch new
		        trig: 1;
		        input: 0.3 asBox .
	self deny: case asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhLineAsDsp [

| case |
case := PhLine new input: 1 asBox; n: 321.
	self deny: case  asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhOnAndOffAsDsp [

	self deny: PhOnAndOff new asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhPeakHoldAsDsp [

| case |
case :=  PhPeakHold new mode:  2 asBox.
	self deny: case asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhPeakHolderAsDsp [
| case |
case := PhPeakHolder new holdTime: 1 asBox.
	self deny: case asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhSampleAndHoldAsDsp [

	| case |
	case := PhSampleAndHold new trig:  1 asBox.
	self deny: case asDsp isNull
]

{ #category : 'tests' }
BasicsTest >> testPhToggleAsDsp [

| case |
case := PhToggle new input: 1 asBox.
	self deny: case asDsp isNull
]
