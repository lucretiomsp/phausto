Class {
	#name : 'PhPolySynthPluginType',
	#superclass : 'PhSynthPluginType',
	#instVars : [
		'voiceCount'
	],
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'defaults' }
PhPolySynthPluginType class >> defaultVoiceCount [
	^ 8
]

{ #category : 'defaults' }
PhPolySynthPluginType class >> voices: anInteger [
	^ self new initializeWithVoiceCount: anInteger
]

{ #category : 'defaults' }
PhPolySynthPluginType >> dspConstructionCpp [
	"fDSP owns the poly object. fPoly is a typed, non-owning alias for keyOn/keyOff.
	control = true: freq/gain/gate are driven by keyOn/keyOff.
	 group = false: parameter paths stay identical to the mono voice,
	 so PhaustoParams.h addresses still match."

	^ '    fPoly = new mydsp_poly (new mydsp(), {1}, true, false);
    fDSP = fPoly;' format: { voiceCount printString }
]

{ #category : 'defaults' }
PhPolySynthPluginType >> faustArchitectureFileName [
	^ 'faustMinimalPolyInlined.h'
]

{ #category : 'initialization' }
PhPolySynthPluginType >> initialize [
	super initialize.
	voiceCount := self class defaultVoiceCount
]

{ #category : 'defaults' }
PhPolySynthPluginType >> midiHandlerCpp [
	"Voice allocation and stealing live in mydsp_poly.
	 keyOn maps pitch to freq, velocity to gain, and sets gate,
	 matching the names in synthControlNames."

	^ 'void <PROC>::handleMidi (const juce::MidiBuffer& midi)
{
    for (const auto metadata : midi)
    {
        const auto m = metadata.getMessage();

        if (m.isNoteOn())
            fPoly->keyOn (m.getChannel() - 1, m.getNoteNumber(), m.getVelocity());
        else if (m.isNoteOff())
            fPoly->keyOff (m.getChannel() - 1, m.getNoteNumber(), m.getVelocity());
        else if (m.isAllNotesOff() || m.isAllSoundOff())
            fPoly->allNotesOff (true);
    }
}'
]

{ #category : 'defaults' }
PhPolySynthPluginType >> midiMembersCpp [
	^ '    mydsp_poly* fPoly = nullptr;   // non-owning alias of fDSP
    void handleMidi (const juce::MidiBuffer& midi);'
]

{ #category : 'accessing' }
PhPolySynthPluginType >> typeName [
	^ 'PolySynth'
]

{ #category : 'accessing' }
PhPolySynthPluginType >> voiceCount [
	^ voiceCount
]
