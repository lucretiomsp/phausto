"
I test DSP>>createBelaCppFileNamed:, the Bela export: one render.cpp per project, Faust code wrapped in architecture/bela.cpp with the Faust headers inlined.

Every test exports into a fresh temporary folder (DSP class>>belaExportFolder:) and deletes it afterwards.

testRenderCppCompilesAgainstBelaHeaders goes further than the file's contents: it compiles render.cpp with clang++ (or g++) -fsyntax-only against the Bela SDK headers in the repository's testFixtures/bela-sdk folder. It skips when there is no compiler or no repository clone, as in a distributed image.
"
Class {
	#name : 'PhBelaExportTest',
	#superclass : 'TestCase',
	#instVars : [
		'dsp',
		'folder'
	],
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'helpers' }
PhBelaExportTest >> belaHeadersFolder [
	"The Bela SDK headers vendored for this test, beside architecture/ in the repository clone."

	^ PhPluginType architectureFolder parent / 'testFixtures' / 'bela-sdk'
]

{ #category : 'helpers' }
PhBelaExportTest >> compilerCommand [
	"The first C++ compiler on the PATH, nil when there is none."

	| found |
	found := (LibC resultOfCommand: 'command -v clang++ || command -v g++') trimBoth.
	^ found ifEmpty: [ nil ]
]

{ #category : 'helpers' }
PhBelaExportTest >> export [

	^ dsp createBelaCppFileNamed: self exportName
]

{ #category : 'helpers' }
PhBelaExportTest >> exportName [

	^ 'PhBelaTest'
]

{ #category : 'helpers' }
PhBelaExportTest >> faustCode [
	"A stereo sine whose frequency follows Bela's analog input 0."

	^ 'import("stdfaust.lib");
process = os.osc(hslider("freq[BELA:ANALOG_0]", 440, 50, 2000, 1)) * 0.2 <: _, _;'
]

{ #category : 'helpers' }
PhBelaExportTest >> quoted: aString [
	"aString as one single-quoted shell word."

	^ '''' , (aString copyReplaceAll: '''' with: '''\''''') , ''''
]

{ #category : 'running' }
PhBelaExportTest >> setUp [

	super setUp.
	folder := FileLocator temp / ('PhBelaExportTest-' , UUID new asString).
	DSP belaExportFolder: folder.
	dsp := DSP new generatedCode: self faustCode
]

{ #category : 'running' }
PhBelaExportTest >> tearDown [

	DSP belaExportFolder: nil.
	folder ensureDeleteAll.
	super tearDown
]

{ #category : 'tests' }
PhBelaExportTest >> testAnswersRenderCppInItsProjectFolder [

	| render |
	render := self export.
	self assert: render exists.
	self assert: render fullName equals: (folder / self exportName / 'render.cpp') fullName
]

{ #category : 'tests' }
PhBelaExportTest >> testDspWithoutFaustCodeFails [

	dsp generatedCode: nil.
	self should: [ self export ] raise: Error
]

{ #category : 'tests' }
PhBelaExportTest >> testExportReplacesPreviousRenderCpp [

	| render |
	render := folder / self exportName / 'render.cpp'.
	render ensureCreateFile.
	render writeStreamDo: [ :s | s nextPutAll: 'stale' ].
	self export.
	self deny: (render contents beginsWith: 'stale')
]

{ #category : 'tests' }
PhBelaExportTest >> testInvalidFaustCodeFailsWithoutRenderCpp [

	"libfaust answers false and leaves an empty file; the export says why and removes it."

	dsp generatedCode: 'process = noSuchFunction;'.
	self
		should: [ self export ]
		raise: Error
		withExceptionDo: [ :e | self assert: (e messageText includesSubstring: 'noSuchFunction') ].
	self deny: (folder / self exportName / 'render.cpp') exists
]

{ #category : 'tests' }
PhBelaExportTest >> testRenderCppCarriesBelaPinMetadata [
	"bela.cpp reads the [BELA:ANALOG_0] label metadata through UI::declare at run time."

	self assert: (self export contents includesSubstring: '"BELA", "ANALOG_0"')
]

{ #category : 'tests' }
PhBelaExportTest >> testRenderCppCompilesAgainstBelaHeaders [

	| compiler render output |
	"About two seconds for the ~100k inlined lines; more on a loaded machine."
	self timeLimit: 60 seconds.
	compiler := self compilerCommand.
	compiler ifNil: [ ^ self skip: 'No C++ compiler on the PATH' ].
	self belaHeadersFolder exists ifFalse: [
		^ self skip: 'No testFixtures/bela-sdk: not running from a repository clone' ].
	render := self export.
	output := LibC resultOfCommand: (String streamContents: [ :s |
		s
			nextPutAll: (self quoted: compiler);
			nextPutAll: ' -std=c++11 -fsyntax-only -w -I';
			nextPutAll: (self quoted: self belaHeadersFolder fullName);
			nextPutAll: ' -I';
			nextPutAll: (self quoted: (self belaHeadersFolder / 'libraries') fullName);
			space;
			nextPutAll: (self quoted: render fullName);
			nextPutAll: ' 2>&1; echo "exit:$?"' ]).
	self
		assert: (output trimBoth endsWith: 'exit:0')
		description: 'render.cpp does not compile:' , String cr , output
]

{ #category : 'tests' }
PhBelaExportTest >> testRenderCppDefinesBelaEntryPoints [

	| contents |
	contents := self export contents.
	#( 'bool setup(BelaContext* context' 'void render(BelaContext* context'
	   'void cleanup(BelaContext* context' 'class mydsp : public dsp' ) do: [ :each |
		self assert: (contents includesSubstring: each) description: each , ' missing' ]
]

{ #category : 'tests' }
PhBelaExportTest >> testRenderCppInlinesFaustHeaders [
	"-i: the board needs the Bela SDK only, not a Faust installation."

	| contents |
	contents := self export contents.
	self assert: (contents includesSubstring: '#include <Bela.h>').
	self deny: (contents includesSubstring: '#include "faust/')
]
