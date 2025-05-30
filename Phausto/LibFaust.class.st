"
I am LibFaust, use me to execute functions from LibFaust
"
Class {
	#name : 'LibFaust',
	#superclass : 'FFILibrary',
	#category : 'Phausto-DynamicEngine',
	#package : 'Phausto',
	#tag : 'DynamicEngine'
}

{ #category : 'library path' }
LibFaust class >> ensurePathInDLLSearch [

	| currentPath librariesBundlePath |

	currentPath := OSPlatform current environment at: 'PATH'.
	librariesBundlePath := (FileLocator image parent / 'librariesBundle') resolve fullName.
	(currentPath includesSubstring: librariesBundlePath) ifTrue: [ ^self ].
	OSPlatform current environment at: 'PATH' put: librariesBundlePath , ';', currentPath .	

]

{ #category : 'export - bela' }
LibFaust >> createBelaCppFileFromString: aString [
|errorBuffer|


errorBuffer := ByteArray new: 4096.

	^  self createBelaCppFileFromString: aString buffer: errorBuffer withName: aString
]

{ #category : 'export - bela' }
LibFaust >> createBelaCppFileFromString: aString buffer: errorMsg [
| myArgv fileOutput |

fileOutput := FileLocator documents asAbsolute pathString .


	myArgv := ExternalAddress arrayOfStringsFrom:
		         #('-lang' 'cpp' '-o' 'testOutput.cpp').
	
	^ [
	  self
		  createBelaCppFileFromString: aString 
		  buffer: errorMsg arguments: myArgv  ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'export - bela' }
LibFaust >> createBelaCppFileFromString: aString buffer: errorMsg arguments: argv [ 

'chiamato cppexportrt' traceCr.

^ self ffiCall:
		   #( bool generateCAuxFilesFromString
        ( const char * 'MyApp', 
          const char * aString, 
          int 6, 
          void * argv, 
          ByteArray errorMsg
        )
    )
]

{ #category : 'export - bela' }
LibFaust >> createBelaCppFileFromString: aString buffer: errorMsg withName: aName [

	| myArgv fileOutput cmajorPatchesDir patchDir architecturePath |
	"we locate the architecture file"
	architecturePath := (FileLocator imageDirectory / 'architecture/bela.cpp')  asAbsolute pathString .
	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'belaPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.

	fileOutput := patchDir asAbsolute pathString , '/' , 'render.cpp'.

	myArgv := ExternalAddress arrayOfStringsFrom: {
			          '-a'.
			          architecturePath .
			          '-lang'.
			          'cpp'.
			          '-o'.
			fileOutput 
			          }.

	^ [
	  self
		  createBelaCppFileFromString: aString
		  buffer: errorMsg
		  arguments: myArgv ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'export - bela' }
LibFaust >> createBelaCppFileFromString: aString withName: aName [
|errorBuffer|


errorBuffer := ByteArray new: 4096.

	^  self createBelaCppFileFromString: aString buffer: errorBuffer withName: aName
]

{ #category : 'export - cmajor' }
LibFaust >> createCMajorFileFromString: aString [
|errorBuffer|


errorBuffer := ByteArray new: 4096.

	^  self createCMajorFileFromString: aString buffer: errorBuffer
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString buffer: errorMsg [
| myArgv fileOutput |

fileOutput := FileLocator documents asAbsolute pathString .


	myArgv := ExternalAddress arrayOfStringsFrom:
		         #('-lang' 'cmajor' '-o' 'testOutput.cmajor').
	
	^ [
	  self
		  createCMajorFileFromString: aString 
		  buffer: errorMsg arguments: myArgv  ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString buffer: errorMsg arguments: argv [ 

^ self ffiCall:
		   #( bool generateCAuxFilesFromString
        ( const char * 'MyApp', 
          const char * aString, 
          int 4, 
          void * argv, 
          ByteArray errorMsg
        )
    )
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString buffer: errorMsg withName: aName [

	| myArgv fileOutput cmajorPatchesDir patchDir |
	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.

	fileOutput := patchDir asAbsolute pathString , '/' , aName
	              , '.cmajor'.

	myArgv := ExternalAddress arrayOfStringsFrom: {
			          '-lang'.
			          'cmajor'.
			          '-cn' ,
			          aName ,
			          '-o'.
			          fileOutput }.

	^ [
	  self
		  createCMajorFileFromString: aString
		  buffer: errorMsg
		  arguments: myArgv ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorFileFromString: aString withName: aName [
|errorBuffer|


errorBuffer := ByteArray new: 4096.

	^  self createCMajorFileFromString: aString buffer: errorBuffer withName: aName
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorMIDIFileFromString: aString buffer: errorMsg arguments: argv [

	^ self ffiCall:
		  #( bool generateCAuxFilesFromString #( const char #* 'MyApp'
		        #, const char #* aString #, int 8 #, void #* argv #, ByteArray
		        errorMsg ) )
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorMIDIFileFromString: aString buffer: errorMsg withName: aName [

	| myArgv fileOutput cmajorPatchesDir patchDir architecturePath |
	"we locate the needed archictecture files"
	architecturePath  := (FileLocator imageDirectory / 'architecture/cmajor/poly-dsp.cmajor')  asAbsolute pathString .
	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.

	fileOutput := patchDir asAbsolute pathString , '/' , aName
	              , '.cmajor'.


	myArgv := ExternalAddress arrayOfStringsFrom: {
			          '-a'.
			          architecturePath .
			          '-lang'.
			          'cmajor-poly'.
			          '-cn'.
			          aName .
			          '-o'.
			          fileOutput }.

	^ [
	  self
		  createCMajorMIDIFileFromString: aString
		  buffer: errorMsg
		  arguments: myArgv ] ensure: [ myArgv freeArrayOfStrings ]
]

{ #category : 'as yet unclassified' }
LibFaust >> createCMajorMIDIFileFromString: aString withName: aName [

	| errorBuffer |
	errorBuffer := ByteArray new: 4096.

	^ self
		  createCMajorMIDIFileFromString: aString
		  buffer: errorBuffer
		  withName: aName
]

{ #category : 'accessing - platform' }
LibFaust >> macLibraryName [

	^ FFIMacLibraryFinder findLibrary: 'librariesBundle/libfaust.2.dylib'
]

{ #category : 'accessing - platform' }
LibFaust >> unix64LibraryName [

	^ FFIUnix64LibraryFinder findLibrary: 'librariesBundle/libfaust.so'
]

{ #category : 'accessing - platform' }
LibFaust >> win32LibraryName [

	LibFaust ensurePathInDLLSearch.

	^ FFIWindowsLibraryFinder new findLibrary:
		  'librariesBundle\libfaust.dll'
]
