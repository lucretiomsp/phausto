Class {
	#name : 'CITest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
CITest >> testDsp [
	
	self deny: SineOsc new asBox isNull.
	
	{ 
		FFIMacLibraryFinder findLibrary: 'librariesBundle/libfaust.2.dylib'.
		FFIMacLibraryFinder findLibrary: 'librariesBundle/libdynamic-engine.dylib' 
	} traceCr.
	
	'DSP process:' traceCr.
	(DSP create: 'process=0;') getHandle asInteger traceCr.

	BoxAPI uniqueInstance destroyLibContext
]
