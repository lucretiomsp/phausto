"
First implementation of Box API for Phausto, deprecated
"
Class {
	#name : 'ManifestPhausto',
	#superclass : 'PackageManifest',
	#category : 'Phausto-Manifest',
	#package : 'Phausto',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestPhausto class >> ruleAssignmentInIfTrueRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#FluteModel #mouthPosition: #false)) #'2024-08-05T15:19:53.278305+02:00') )
]

{ #category : 'code-critics' }
ManifestPhausto class >> ruleCascadedNextPutAllsRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#'DSP class' #asCmajorPatchFileNamed: #true)) #'2024-08-22T09:34:26.638554+02:00') #(#(#RGMethodDefinition #(#'DSP class' #asCmajorPatchFileNamed:hasMIDI: #true)) #'2024-09-06T10:40:19.450496+02:00') )
]

{ #category : 'code-critics' }
ManifestPhausto class >> rulePrecedenceRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGMethodDefinition #(#LFORandomPos #asBox #false)) #'2024-10-14T13:38:08.64591+02:00') )
]
