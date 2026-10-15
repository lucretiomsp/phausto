Class {
	#name : 'PhPolySynthEditorExportIntegrationTest',
	#superclass : 'PhMonoSynthEditorExportIntegrationTest',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'helpers' }
PhPolySynthEditorExportIntegrationTest >> pluginType [

	^ PhPolySynthPluginType voices: 4
]
