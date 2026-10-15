Class {
	#name : 'PhBuildScriptTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'accessing' }
PhBuildScriptTest >> script [

	^ (PhBuildScript for: (PhPluginIdentity productName: 'MyPhaustoPlugin')) contents
]

{ #category : 'accessing' }
PhBuildScriptTest >> testBuildsReleaseOnMultiConfigGenerators [
	"Visual Studio and Xcode ignore CMAKE_BUILD_TYPE; only --config picks Release."

	self assert: (self script includesSubstring: '--config Release')
]

{ #category : 'accessing' }
PhBuildScriptTest >> testConfiguresOnlyOnce [

	self assert: (self script includesSubstring: 'if(NOT EXISTS "${build_dir}/CMakeCache.txt")')
]

{ #category : 'accessing' }
PhBuildScriptTest >> testFailsLoudly [

	self assert: (self script includesSubstring:
			 'message(FATAL_ERROR "Configuring MyPhaustoPlugin failed.")').
	self assert: (self script includesSubstring:
			 'message(FATAL_ERROR "Building MyPhaustoPlugin failed.")')
]

{ #category : 'tests' }
PhBuildScriptTest >> testFileNameMatchesUsageLine [

	| buildScript |
	buildScript := PhBuildScript for: (PhPluginIdentity productName: 'MyPhaustoPlugin').
	self assert: (buildScript contents includesSubstring: 'cmake -P ' , buildScript fileName)
]

{ #category : 'accessing' }
PhBuildScriptTest >> testHonoursJucePathFromCommandLineOrEnvironment [

	self assert: (self script includesSubstring: '"-DJUCE_PATH=${JUCE_PATH}"').
	self assert: (self script includesSubstring: '"-DJUCE_PATH=$ENV{JUCE_PATH}"')
]
