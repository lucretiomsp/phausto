"
Monophonic synth plugin type: one voice, last-note priority, handled in the processor by handleMidi. **freq**, **gate** and **gain** stay out of the APVTS table because MIDI drives them (synthControlNames, from _PhSynthPluginType_). Parameters reach the DSP once per block, so a retriggered note starts one block late, in a block that runs with gate 0.

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
	"Last-note-priority mono handler. Parameters reach the DSP once per block, so a retriggered note is deferred by one block that runs with gate 0: that gives the envelope its rising edge, as Faust's poly architecture does for stolen voices.
	 A note-off at the same position as the last note-on ends the previous instance of a repeated pitch, so it is ignored."

	^ 'void <PROC>::startNote (int note, float velocity)
{
    currentNote = note;
    fUI->setParamValue ("freq", (float) juce::MidiMessage::getMidiNoteInHertz (note));
    fUI->setParamValue ("gain", velocity);
    fUI->setParamValue ("gate", 1.0f);
    gateOpen = true;
}

void <PROC>::handleMidi (const juce::MidiBuffer& midi)
{
    const bool openAtStart = gateOpen;   // the gate the DSP saw during the previous block

    if (pendingNote >= 0)
    {
        startNote (pendingNote, pendingVelocity);
        pendingNote = -1;
    }

    int lastNoteOnPosition = -1;

    for (const auto metadata : midi)
    {
        const auto m = metadata.getMessage();

        if (m.isNoteOn())
        {
            lastNoteOnPosition = metadata.samplePosition;

            if (openAtStart)
            {
                fUI->setParamValue ("gate", 0.0f);
                gateOpen = false;
                currentNote = m.getNoteNumber();
                pendingNote = currentNote;
                pendingVelocity = m.getFloatVelocity();
            }
            else
            {
                startNote (m.getNoteNumber(), m.getFloatVelocity());
            }
        }
        else if (m.isNoteOff() && m.getNoteNumber() == currentNote
                 && metadata.samplePosition != lastNoteOnPosition)
        {
            fUI->setParamValue ("gate", 0.0f);
            gateOpen = false;
            currentNote = -1;
            pendingNote = -1;
        }
    }
}'
]

{ #category : 'initialization' }
PhMonoSynthPluginType >> midiMembersCpp [

	^ '    int currentNote = -1;
    int pendingNote = -1;
    float pendingVelocity = 0.0f;
    bool gateOpen = false;
    void startNote (int note, float velocity);
    void handleMidi (const juce::MidiBuffer& midi);'
]

{ #category : 'defaults' }
PhMonoSynthPluginType >> typeName [

	^ 'MonoSynth'
]
