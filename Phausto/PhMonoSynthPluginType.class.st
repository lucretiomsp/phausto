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

{ #category : 'initialization' }
PhMonoSynthPluginType >> midiHandlerCpp [
	"Last-note priority, once per block (not sample-accurate). MapUI::setParamValue
	 falls back to the label map, so bare names reach the zones."

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

{ #category : 'initialization' }
PhMonoSynthPluginType >> midiMembersCpp [

	^ '    int currentNote = -1;
    void handleMidi (const juce::MidiBuffer& midi);'
]

{ #category : 'defaults' }
PhMonoSynthPluginType >> typeName [

	^ 'MonoSynth'
]
