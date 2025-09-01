"
Super class to create Cmajor patches
"
Class {
	#name : 'CmajorPatch',
	#superclass : 'Object',
	#instVars : [
		'name',
		'dsp'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'converting' }
CmajorPatch class >> asCmajorPatchFileNamed: aName [

	| hasMidi cmajorPatchesDir patchDir|
	"we need to improve the mechanism to generate MIDI instruments"
	hasMidi := 'false,'.

	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
		patchDir := (cmajorPatchesDir / aName	) ensureCreateDirectory.
	(patchDir / (aName , '.cmajorpatch')) writeStream
		cr;
		nextPutAll: '{';
		nextPutAll: '"CmajorVersion":';
		tab;
		nextPutAll: '1,';
		cr;
		nextPutAll: '"ID":';
		tab;
		nextPutAll: '"pharo.' , aName , '",';
		cr;
		nextPutAll: '"version":';
		tab;
		nextPutAll: '"1.0",';
		cr;
		nextPutAll: '"name":';
		tab;
		nextPutAll: '"' , aName , '"' , ',';
		cr;
		nextPutAll: '"description":';
		tab;
		nextPutAll: '"A ' , aName , ' generated in Pharo using Phausto",';
		cr;
		nextPutAll: '"manufacturer":';
		tab;
		nextPutAll: '"Pharo Association",';
		cr;
		nextPutAll: '"isInstrument":';
		tab;
		nextPutAll: hasMidi;
		cr;
		nextPutAll: '"source":';
		tab;
		nextPutAll: '"' , aName , '.cmajor"';
		cr;
		nextPutAll: '}';
		close
]

{ #category : 'converting' }
CmajorPatch class >> asCmajorPatchFileNamed: aName hasMIDI: aBoolean [

	| hasMidi cmajorPatchesDir patchDir cmajorPatchFile polyWrapperString |
	"we need to improve the mechanism to generate MIDI instruments"
	hasMidi := aBoolean asString , ','.
	polyWrapperString := ''.
	aBoolean ifTrue: [
		polyWrapperString :=  '"' , aName , 'polyWrapper' , '.cmajor",' ].
	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.

	cmajorPatchFile := patchDir / (aName , '.cmajorpatch').
	"delete the file if the file already exists and create another one. maybe should we ask for overwrite?"
	cmajorPatchFile exists ifTrue: [ cmajorPatchFile delete ].
	cmajorPatchFile writeStream
		cr;
		nextPutAll: '{';
		nextPutAll: '"CmajorVersion":';
		tab;
		nextPutAll: '1,';
		cr;
		nextPutAll: '"ID":';
		tab;
		nextPutAll: '"pharo.' , aName , '",';
		cr;
		nextPutAll: '"version":';
		tab;
		nextPutAll: '"1.0",';
		cr;
		nextPutAll: '"name":';
		tab;
		nextPutAll: '"' , aName , '"' , ',';
		cr;
		nextPutAll: '"description":';
		tab;
		nextPutAll: '"A ' , aName , ' generated in Pharo using Phausto",';
		cr;
		nextPutAll: '"manufacturer":';
		tab;
		nextPutAll: '"Pharo Association",';
		cr;
		nextPutAll: '"isInstrument":';
		tab;
		nextPutAll: hasMidi;
		cr;
		nextPutAll: '"source":';
		tab;
		nextPutAll: '[';
		nextPutAll: polyWrapperString;
		nextPutAll: ' "' , aName , '.cmajor" ]';
		cr;
		nextPutAll: '}';
		close
]

{ #category : 'api - exporting' }
CmajorPatch >> dsp [ 

^ dsp
]

{ #category : 'accessing' }
CmajorPatch >> dsp: aDsp [

	dsp := aDsp 
]

{ #category : 'api - exporting' }
CmajorPatch >> export [ 
self subclassResponsibility 
]

{ #category : 'api - exporting' }
CmajorPatch >> name [ 
^ name
]

{ #category : 'accessing' }
CmajorPatch >> name: aString [

name := aString
]
