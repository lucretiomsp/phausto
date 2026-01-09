Class {
	#name : 'CompressorsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CompressorsTest >> TODOtestPhLimiter1176MonoAsDsp [
self deny: PhLimiter1176Mono new  asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> TODOtestPhPeakCompressionGainMultichannelAsDsp [


"crashes apparently for no reason"
self assert: 1 equals: 0
	"self deny: PhPeakCompressionGainMultichannel new asDsp isNull"
]

{ #category : 'tests' }
CompressorsTest >> testLimiterMonoAsDsp [

	self deny: PhLimiter1176Mono new asDsp isNull 
]

{ #category : 'tests' }
CompressorsTest >> testPhCompressorLadMonoAsDsp [

	self deny: PhCompressorLadMono new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhCompressorMonoAsDsp [
self deny: PhCompressorMono new  asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhCompressorStereoAsDsp [

	self deny: PhCompressorStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhLimiter1176StereoAsDsp [
self deny: PhLimiter1176Stereo new  asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhPeakCompressionGainMonoAsDsp [

	self deny: PhPeakCompressionGainMono new asDsp isNull
]
