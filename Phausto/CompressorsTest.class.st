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
CompressorsTest >> testPhExpandernStereoAsDsp [

	self deny: PhExpanderStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhFBCompressorGainStereoAsDsp [

	self deny: PhFBCompressorGainStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhFBFFCompressorGainStereoAsDsp [

	self deny: PhFBFFCompressorGainStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhFFCompressorGainStereoAsDsp [

	self deny: PhFFCompressorGainStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhLimiter1176StereoAsDsp [
self deny: PhLimiter1176Stereo new  asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhPeakCompressionDbGainStereoAsDsp [

	self deny: PhPeakCompressionGainStereo_dB new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhPeakCompressionGainDbMonoAsDsp [

	self deny: PhPeakCompressionGainMono_dB new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhPeakCompressionGainMonoAsDsp [ 

	self deny: PhPeakCompressionGainMono new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhPeakCompressionGainStereoAsDsp [

	self deny: PhPeakCompressionGainStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhPeakExpansionGainStereoAsDsp [

	self deny: PhPeakExpansionGainStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhRMSCompressionDbGainMonoAsDsp [

	self deny: PhRMSCompressionGainMono_dB new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhRMSCompressionGainDbStereoAsDsp [

	self deny: PhRMSCompressionGainStereo_dB new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhRMSCompressionGainMonoAsDsp [

	self deny: PhRMSCompressionGainMono new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhRMSCompressionGainStereoAsDsp [

	self deny: PhRMSCompressionGainStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhRMSFBCompressorGainStereoAsDsp [

	self deny: PhRMSFBCompressorGainStereo new asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhRMSFBFFCompressorGainStereoAsDsp [

	self deny: PhRMSFBFFCompressorGainStereo new asDsp isNull
]
