"Preloading script"

"Set iceberg to work on HTTPs by default, we don't have SSH on gitlab-CI"
Iceberg remoteTypeSelector: #httpsUrl.

"Load the Pharo VM repository and lock it"
EpMonitor disableDuring: [ 
    Smalltalk platform isUnix ifTrue: [
		'/home/runner/.smalltalkCI/_builds/librariesBundle/libdynamic-engine.so' asFileReference copyTo:
			Smalltalk vm fullPath asFileReference parent / 'libdynamic-engine.so'.
    ]
].