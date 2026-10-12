Class {
	#name : 'PhMonoSynthEditorExportIntegrationTest',
	#superclass : 'PhEditorExportIntegrationTest',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'helpers' }
PhMonoSynthEditorExportIntegrationTest >> faustCode [
	"freq, gate and gain are MIDI-driven and excluded from APVTS. release stays,
	 so the parameter table is not empty (the zero-parameter case is not fixed yet)."

	^ 'import("stdfaust.lib");
freq = hslider("freq", 440, 20, 4086, 1);
gate = button("gate");
gain = hslider("gain", 0.5, 0, 1, 0.01);
release = hslider("release", 0.1, 0.001, 2, 0.001);
process = os.square(freq) * en.ar(0.01, release, gate) * gain <: _, _;'
]

{ #category : 'helpers' }
PhMonoSynthEditorExportIntegrationTest >> pluginType [

	^ PhMonoSynthPluginType new
]
