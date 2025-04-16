"
I am the Baseline of Phausto
"
Class {
	#name : 'BaselineOfPhausto',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfPhausto',
	#package : 'BaselineOfPhausto'
}

{ #category : 'baselines' }
BaselineOfPhausto >> baseline: spec [

	<baseline>
	spec for: #common do: [
		"spec postLoadDoIt: #copyLibraries."

		spec
			baseline: 'MasterLu'
			with: [ spec repository: 'github://lucretiomsp/MasterLu:main' ].

		spec package: 'Phausto' with: [ spec requires: #( 'MasterLu' ) ].

		spec group: 'default' with: #( 'Phausto' 'MasterLu' ) ]
]

{ #category : 'utilities' }
BaselineOfPhausto >> copyARM64LibrariesFrom: repoDirectory [
	"Libs for ARM64 are stored in a dmg file, copied with a command equivalent to:
	[ dmg attach copyTo: (imgDirPath / 'librariesBundle') ensureCreateDirectory ]
		ensure: [ dmg detach ]"

	| imgDirPath command |
	imgDirPath := Smalltalk imagePath copyUpToLast: $/.
	command := String streamContents: [ :s |
		           s << '(hdiutil attach "'
		             << (repoDirectory / 'phaustoLibrariesM1.dmg') pathString
		             << '" -mountpoint /Volumes/phaustoLibrariesM1 -nobrowse -readonly'
		             << '&& mkdir -p "' << imgDirPath << '/librariesBundle"'
		             << '&& cp -R /Volumes/phaustoLibrariesM1/* "'
		             << imgDirPath << '/librariesBundle"'
		             << '); hdiutil detach /Volumes/phaustoLibrariesM1' ].
	(LibC runCommand: command) = 0 ifFalse: [ self warnCopyFailed ]
]

{ #category : 'utilities' }
BaselineOfPhausto >> copyLibraries [
	"Copy the libraries from the Phausto Git directory to the image directory."

	IceRepository registry
		detect: [ :each | each includesPackageNamed: self class packageName ]
		ifFound: [ :registry |
			self copyLibrariesFrom: registry subdirectoryReference ]
		ifNone: [ self warnCopyFailed ]
]

{ #category : 'utilities' }
BaselineOfPhausto >> copyLibrariesFrom: repoDirectory [

	| platform |
	platform := OSPlatform current.
	(platform isMacOS and: [ platform processorArchitecture = 'arm64' ])
		ifTrue: [ ^ self copyARM64LibrariesFrom: repoDirectory ].

	ZipArchive
		extractFrom: repoDirectory / (platform isMacOS
				 ifTrue: [ 'librariesBundle_mac_intel.zip' ]
				 ifFalse: [
					 platform isUnix
						 ifTrue: [ 'librariesBundle_Linux.zip' ]
						 ifFalse: [ 'librariesBundle_windows_intel.zip' ] ])
		to: Smalltalk imagePath asFileReference parent
]

{ #category : 'utilities' }
BaselineOfPhausto >> warnCopyFailed [

	<debuggerCompleteToSender>
	Warning signal:
		'Failed to install Faust libraries, they must be copied to the image directory manually, see https://github.com/lucretiomsp/phausto/wiki'
]
