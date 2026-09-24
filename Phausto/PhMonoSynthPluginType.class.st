"
PhMonoSynthPluginType comment: 'freq, gate, and gain from the APVTS table because MIDI drives them directly via handleMidi (last-note-priority, per-block). The three excluded names follow the Faust standard convention that Phausto uses by construction.
"
Class {
	#name : 'PhMonoSynthPluginType',
	#superclass : 'PhSynthPluginType',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'defaults' }
PhMonoSynthPluginType class >> excludesControl: aControl [ 
	"MIDI drives these directly, they must not appear in APVTS."
	^ self synthControlNames includes: (aControl at: #shortname)
]
