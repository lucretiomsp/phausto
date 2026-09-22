"
PhMonoSynthPluginType comment: 'freq, gate, and gain from the APVTS table because MIDI drives them directly via handleMidi (last-note-priority, per-block). The three excluded names follow the Faust standard convention that Phausto uses by construction.
"
Class {
	#name : 'PhMonoSynthPluginType',
	#superclass : 'PhPluginType',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'defaults' }
PhMonoSynthPluginType class >> excludesControl: aControl [ 
	"MIDI drives these directly, they must not appear in APVTS."
	^ self synthControlNames includes: (aControl at: #shortname)
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> acceptsMidi [
	^ true
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> auMainType [
	^ 'kAudioUnitType_MusicDevice'
]

{ #category : 'defaults' }
PhMonoSynthPluginType >> busesPropertiesCpp [

	^ 'BusesProperties()
                          .withOutput ("Output", juce::AudioChannelSet::stereo(), true)'
]

{ #category : 'defaults' }
PhMonoSynthPluginType >> excludesControl: aControl [ 
	"MIDI drives these directly, they must not appear in APVTS."
	^ self synthControlNames includes: (aControl at: #shortname)
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> hasAudioInput [
	^ false
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> isSynth [
	^ true
]

{ #category : 'defaults' }
PhMonoSynthPluginType >> juceVstCategory [

	^ 'kPlugCategSynth' 
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> jucerVstCategory [
	^ 'kPlugCategSynth'
]

{ #category : 'defaults' }
PhMonoSynthPluginType >> midiHandlerCpp [ 
	"Last-note-priority mono. Per-block, not sample-accurate. MapUI::setParamValue falls back to the label map, so bare names work without full Faust paths."

	^ 'void <PROC>::handleMidi (const juce::MidiBuffer& midi)
{
    for (const auto metadata : midi)
    {
        const auto m = metadata.getMessage();

        if (m.isNoteOn())
        {
            currentNote = m.getNoteNumber();
            fUI->setParamValue ("freq", (float) juce::MidiMessage::getMidiNoteInHertz (currentNote));
            fUI->setParamValue ("gain", m.getFloatVelocity());
            fUI->setParamValue ("gate", 1.0f);
        }
        else if (m.isNoteOff() && m.getNoteNumber() == currentNote)
        {
            fUI->setParamValue ("gate", 0.0f);
            currentNote = -1;
        }
    }
}'

]

{ #category : 'defaults' }
PhMonoSynthPluginType >> midiMembersCpp [ 
	^ '    int currentNote = -1;
    void handleMidi (const juce::MidiBuffer& midi);'
]

{ #category : 'defaults' }
PhMonoSynthPluginType >> processBlockMidiCallCpp [ 
	^ '    handleMidi (midiMessages);'
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> synthControlNames [ 
	^ #( 'freq' 'gate' 'gain' )
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> typeName [
	^ 'MonoSynth'
]

{ #category : 'accessing' }
PhMonoSynthPluginType >> vst3Category [
	^ 'Instrument'
]
