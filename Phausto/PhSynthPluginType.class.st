Class {
	#name : 'PhSynthPluginType',
	#superclass : 'PhPluginType',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'instance creation' }
PhSynthPluginType class >> fromString: aString [
	"Lookup over concrete subclasses only."

	^ self allSubclasses
		detect: [ :cls | cls isAbstract not and: [ cls new typeName = aString ] ]
		ifNone: [ self error: 'Unknown plugin type: ' , aString ]
]

{ #category : 'testing' }
PhSynthPluginType class >> isAbstract [ 

^ self == PhSynthPluginType 
]

{ #category : 'accessing' }
PhSynthPluginType >> acceptsMidi [
	^ true
]

{ #category : 'accessing' }
PhSynthPluginType >> auMainType [
	^ 'kAudioUnitType_MusicDevice'
]

{ #category : 'defaults' }
PhSynthPluginType >> busesPropertiesCpp [

	^ 'BusesProperties()
                          .withOutput ("Output", juce::AudioChannelSet::stereo(), true)'
]

{ #category : 'defaults' }
PhSynthPluginType >> dspConstructionCpp [
	"Statements that create the owning dsp pointer fDSP.
	 Match the line currently emitted by the processor template."

	^ '    fDSP = new mydsp();'
]

{ #category : 'defaults' }
PhSynthPluginType >> excludesControl: aControl [ 
	"MIDI drives these directly, they must not appear in APVTS."
	^ self synthControlNames includes: (aControl at: #shortname)
]

{ #category : 'defaults' }
PhSynthPluginType >> faustArchitectureFileName [
	"Faust architecture file wrapped around the generated mydsp."

	^ 'faustMinimalInlined.h'
]

{ #category : 'accessing' }
PhSynthPluginType >> hasAudioInput [
	^ false
]

{ #category : 'accessing' }
PhSynthPluginType >> isSynth [
	^ true
]

{ #category : 'defaults' }
PhSynthPluginType >> juceVstCategory [

	^ 'kPlugCategSynth' 
]

{ #category : 'accessing' }
PhSynthPluginType >> jucerVstCategory [
	^ 'kPlugCategSynth'
]

{ #category : 'defaults' }
PhSynthPluginType >> midiHandlerCpp [ 
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
PhSynthPluginType >> midiMembersCpp [ 
	^ '    int currentNote = -1;
    void handleMidi (const juce::MidiBuffer& midi);'
]

{ #category : 'defaults' }
PhSynthPluginType >> processBlockMidiCallCpp [ 
	^ '    handleMidi (midiMessages);'
]

{ #category : 'accessing' }
PhSynthPluginType >> synthControlNames [ 
	^ #( 'freq' 'gate' 'gain' )
]

{ #category : 'accessing' }
PhSynthPluginType >> typeName [
	^ 'MonoSynth'
]

{ #category : 'accessing' }
PhSynthPluginType >> vst3Category [
	^ 'Instrument'
]
