Class {
	#name : 'CompressorsTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

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
CompressorsTest >> testPhLimiter1176MonoAsDsp [
self deny: PhLimiter1176Mono new  asDsp isNull
]

{ #category : 'tests' }
CompressorsTest >> testPhLimiter1176StereoAsDsp [
self deny: PhLimiter1176Stereo new  asDsp isNull
]
