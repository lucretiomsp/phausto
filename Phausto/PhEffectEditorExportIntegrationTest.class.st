Class {
	#name : 'PhEffectEditorExportIntegrationTest',
	#superclass : 'PhEditorExportIntegrationTest',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'helpers' }
PhEffectEditorExportIntegrationTest >> faustCode [
	"A stereo effect with one control. g is defined once, so both channels share one widget."

	^ 'import("stdfaust.lib");
process = _, _ : *(g), *(g)
with { g = hslider("gain", 0.5, 0, 1, 0.01); };'
]

{ #category : 'helpers' }
PhEffectEditorExportIntegrationTest >> pluginType [

	^ PhEffectPluginType new
]
