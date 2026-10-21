"
Polyphonic synth plugin type. A Strategy that carries configuration: voiceCount (default 8, at least 2). Create it with PhPolySynthPluginType voices: 12, or export with DSP >> export2JuceWithName:polyphony:. The synth facts (MIDI in, no input bus, Instrument categories) come from PhSynthPluginType.

The voices live in Faust. faustMinimalPolyInlined.h provides mydsp_poly, which allocates, steals, frees and mixes the voices. The generated handleMidi only routes note on, note off and all notes off to keyOn, keyOff and allNotesOff.

Parameters bypass the wrapper's UI: its paths gain a /Polyphonic/Voices prefix, and its group control relies on GUI::updateAllGuis(), whose static list every plugin instance in a host shares. Instead, the constructor resolves each APVTS parameter to one zone per voice, and pushParameters writes them all once per block.

The APVTS table leaves out freq, gate and gain (keyOn drives them) and the wrapper's own controls (Panic, per-voice copies). compute runs in chunks of at most MIX_BUFFER_SIZE (4096) frames, the size of mydsp_poly's mix buffers.

Limits: MIDI is applied once per block, not sample-accurately. The 2020 mydsp_poly restarts a stolen voice without a crossfade and prints each steal to std::cout.
"
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

{ #category : 'accessing' }
PhPolySynthPluginType >> computeBlockSizeCpp [
	"mydsp_poly mixes into buffers of MIX_BUFFER_SIZE frames and does not check in release builds."

	^ 'juce::jmin (samplesPerBlock, MIX_BUFFER_SIZE)'
]

{ #category : 'initialization' }
PhPolySynthPluginType >> dspConstructionCpp [
	"control = true: keyOn and keyOff allocate the voices. Each voice is a MapUI over
	 its own mono clone, so each parameter resolves once to one zone per voice, and
	 pushParameters writes plain floats without GUI::updateAllGuis(), whose GUI list
	 every plugin instance in the host shares. Concatenation, not format:, which would
	 read the C++ braces as placeholders."

	^ '    fPoly = new mydsp_poly (new mydsp(), ' , voiceCount printString , ', true);
    fDSP.reset (fPoly);

    // A voice knows a control as /<program>/<path>. PhaustoParams.h may name the program
    // differently, and a DSP made with asDspMIDIWithName: adds /Polyphonic/Voices in front.
    const auto pathBelowProgram = [] (juce::String path)
    {
        if (path.startsWith ("/Polyphonic/Voices/"))
            path = path.fromFirstOccurrenceOf ("/Polyphonic/Voices", false, false);
        return path.fromFirstOccurrenceOf ("/", false, false)
                   .fromFirstOccurrenceOf ("/", true, false);
    };

    for (int i = 0; i < PhaustoParams::count; ++i)
    {
        const auto address = pathBelowProgram (PhaustoParams::table[i].faustPath);
        for (auto* voice : fPoly->fVoiceTable)
        {
            float* zone = nullptr;
            for (auto& [voicePath, candidate] : voice->getMap())
                if (pathBelowProgram (voicePath) == address)
                    zone = candidate;
            jassert (zone != nullptr); // PhaustoParams.h does not match the Faust header
            voiceZones.push_back (zone);
        }
    }'
]

{ #category : 'initialization' }
PhPolySynthPluginType >> dspInitCpp [
	"init resets each voice but leaves a sounding one allocated, so free them first.  Each voice computed fMinRelease (the shortest release before it is freed) at construction, before any sample rate existed. fMinRelease only exists in the 2020 mydsp_poly of faustMinimalPolyInlined.h."

	^ '    fPoly->allNotesOff (true);
    fDSP->init ((int) sampleRate);
    for (auto* voice : fPoly->fVoiceTable)
        voice->fMinRelease = (int) sampleRate / 2;'
]

{ #category : 'initialization' }
PhPolySynthPluginType >> dspMembersCpp [
	"The header must not include the Faust header, so class mydsp_poly* declares the type in place."

	^ '    class mydsp_poly* fPoly = nullptr; // non-owning alias of fDSP
    std::vector<float*> voiceZones;    // parameter * voices + voice'
]

{ #category : 'accessing' }
PhPolySynthPluginType >> excludesControl: aControl [

	^ (super excludesControl: aControl) or: [ self isPolyWrapperControl: aControl ]
]

{ #category : 'accessing' }
PhPolySynthPluginType >> excludesParameter: aParameter [
	"The poly wrapper's own controls are not the synth's: the APVTS leaves them out too."

	^ (super excludesParameter: aParameter) or: [ self isPolyWrapperParameter: aParameter ]
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

{ #category : 'initialization' }
PhPolySynthPluginType >> initializeWithVoiceCount: anInteger [
	"Fail Fast: a single mydsp_poly voice steals itself on every overlapping note."

	(anInteger isInteger and: [ anInteger >= 2 ]) ifFalse: [
		^ self error: 'PolySynth needs at least 2 voices; use PhMonoSynthPluginType for one.' ].
	voiceCount := anInteger
]

{ #category : 'accessing' }
PhPolySynthPluginType >> isPolyWrapperControl: aControl [
	"A DSP made with asDspMIDIWithName: carries Faust's poly UI in its JSON Only /Polyphonic/Voices/<program>/... are voice controls; Panic and  per-voice copies belong to the wrapper."

	| steps |
	steps := (aControl at: #address ifAbsent: [ '' ]) substrings: '/'.
	steps isEmpty ifTrue: [ ^ false ].
	steps first = 'Polyphonic' ifFalse: [ ^ false ].
	^ steps size < 4 or: [ (steps at: 2) ~= 'Voices' ]
]

{ #category : 'accessing' }
PhPolySynthPluginType >> isPolyWrapperParameter: aParameter [
	"A DSP made with asDspMIDIWithName: carries Faust's poly UI in its JSON. Only _/Polyphonic/Voices/<program>/..._ are voice controls; Panic and theper-voice copies belong to the wrapper."

	| steps |
	steps := aParameter address substrings: '/'.
	steps isEmpty ifTrue: [ ^ false ].
	steps first = 'Polyphonic' ifFalse: [ ^ false ].
	^ steps size < 4 or: [ (steps at: 2) ~= 'Voices' ]
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

{ #category : 'initialization' }
PhPolySynthPluginType >> midiMembersCpp [
	"fPoly moved to dspMembersCpp."

^ '    void handleMidi (const juce::MidiBuffer& midi);'
]

{ #category : 'accessing' }
PhPolySynthPluginType >> pushParametersBodyCpp [
	"Every block, so the values survive the reset init applies in prepareToPlay."

	^ '    const size_t voices = fPoly->fVoiceTable.size();
    for (int i = 0; i < PhaustoParams::count; ++i)
    {
        if (raw[i] == nullptr)
            continue;
        const float value = raw[i]->load();
        for (size_t k = 0; k < voices; ++k)
            if (float* zone = voiceZones[(size_t) i * voices + k])
                *zone = value;
    }'
]

{ #category : 'accessing' }
PhPolySynthPluginType >> typeName [
	^ 'PolySynth'
]

{ #category : 'accessing' }
PhPolySynthPluginType >> voiceCount [
	^ voiceCount
]
