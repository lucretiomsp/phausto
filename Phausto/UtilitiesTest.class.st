Class {
	#name : 'UtilitiesTest',
	#superclass : 'TestCase',
	#category : 'Phausto-Tests',
	#package : 'Phausto',
	#tag : 'Tests'
}

{ #category : 'tests' }
UtilitiesTest >> testDictionaryAsCmajorEventEndpoint [

	| slider button resultSlider resultButton |
	resultSlider := 'input event float32 event_ADSREnvAttack [[ name: "ADSREnvAttack", group: "/v:MyApp/ADSREnvAttack", min: 0.001f, max: 2.0f, init: 0.001f, step: 1.0f ]];'.
	slider := Dictionary new.
	slider
		add: #min -> 0.001;
		add: #step -> 1;
		add: #address -> '/MyApp/ADSREnvAttack';
		add: #shortname -> 'ADSREnvAttack';
		add: #max -> 2;
		add: #type -> 'hslider';
		add: #label -> 'ADSREnvAttack';
		add: #init -> 0.001.

	button := Dictionary new.
	button
		add: #address -> '/MyApp/gate';
		add: #label -> 'gate';
		add: #shortname -> 'gate';
		add: #type -> 'button'.

	resultButton := 'input event float32 event_gate [[ name: "gate", group: "/v:MyApp/gate", text: "gate", boolean ]];'.
	self assert: slider asCmajorEventEndpoint equals: resultSlider.
	self assert: button asCmajorEventEndpoint equals: resultButton
]

{ #category : 'tests' }
UtilitiesTest >> testDictionaryAsCmajorListofUIEndpoints [

	| parameters attack decay release sustain level freq gain gate result |
	parameters := Dictionary new.
	attack := Dictionary new.
	attack
		add: #address -> '/MyApp/ADSREnvAttack';
		add: #init -> 0.001;
		add: #label -> 'ADSREnvAttack';
		add: #max -> 2;
		add: #min -> 0.001;
		add: #shortname -> 'ADSREnvAttack';
		add: #step -> 1;
		add: #type -> 'hslider'.
	decay := Dictionary new.
	decay
		add: #address -> '/MyApp/ADSREnvDecay';
		add: #init -> 0.2;
		add: #label -> 'ADSREnvDecay';
		add: #max -> 2;
		add: #min -> 0.001;
		add: #shortname -> 'ADSREnvDecay';
		add: #step -> 1;
		add: #type -> 'hslider'.

	release := Dictionary new.
	release
		add: #address -> '/MyApp/ADSREnvRelease';
		add: #init -> 0.3;
		add: #label -> 'ADSREnvRelease';
		add: #max -> 3;
		add: #min -> 0;
		add: #shortname -> 'ADSREnvRelease';
		add: #step -> 0.001;
		add: #type -> 'hslider'.

	sustain := Dictionary new.
	sustain
		add: #address -> '/MyApp/ADSREnvSustain';
		add: #init -> 0.5;
		add: #label -> 'ADSREnvSustain';
		add: #max -> 1;
		add: #min -> 0;
		add: #shortname -> 'ADSREnvSustain';
		add: #step -> 0.001;
		add: #type -> 'hslider'.

	level := Dictionary new.
	level
		add: #address -> '/MyApp/ADSREnvuLevel';
		add: #init -> 0.5;
		add: #label -> 'ADSREnvuLevel';
		add: #max -> 1;
		add: #min -> 0;
		add: #shortname -> 'ADSREnvuLevel';
		add: #step -> 0.001;
		add: #type -> 'hslider'.

	freq := Dictionary new.
	freq
		add: #address -> '/MyApp/freq';
		add: #init -> 200;
		add: #label -> 'freq';
		add: #max -> 1200;
		add: #min -> 20;
		add: #shortname -> 'freq';
		add: #step -> 1;
		add: #type -> 'hslider'.

	gain := Dictionary new.
	gain
		add: #address -> '/MyApp/gain';
		add: #init -> 0.5;
		add: #label -> 'gain';
		add: #max -> 1;
		add: #min -> 0;
		add: #shortname -> 'gain';
		add: #step -> 0.01;
		add: #type -> 'hslider'.

	gate := Dictionary new.
	gate
		add: #address -> '/MyApp/gate';
		add: #label -> 'gate';
		add: #shortname -> 'gate';
		add: #type -> 'button'.

	parameters add: #ADSREnvAttack -> attack.
	parameters add: #ADSREnvDecay -> decay.
	parameters add: #ADSREnvRelease -> release.
	parameters add: #ADSREnvSustain -> sustain.
	parameters add: #ADSREnvuLevel -> level.

	result := 'input event float32 event_ADSREnvuLevel [[ name: "ADSREnvuLevel", group: "/v:MyApp/ADSREnvuLevel", min: 0.0f, max: 1.0f, init: 0.5f, step: 0.001f ]];
input event float32 event_ADSREnvRelease [[ name: "ADSREnvRelease", group: "/v:MyApp/ADSREnvRelease", min: 0.0f, max: 3.0f, init: 0.3f, step: 0.001f ]];
input event float32 event_ADSREnvAttack [[ name: "ADSREnvAttack", group: "/v:MyApp/ADSREnvAttack", min: 0.001f, max: 2.0f, init: 0.001f, step: 1.0f ]];
input event float32 event_ADSREnvSustain [[ name: "ADSREnvSustain", group: "/v:MyApp/ADSREnvSustain", min: 0.0f, max: 1.0f, init: 0.5f, step: 0.001f ]];
input event float32 event_ADSREnvDecay [[ name: "ADSREnvDecay", group: "/v:MyApp/ADSREnvDecay", min: 0.001f, max: 2.0f, init: 0.2f, step: 1.0f ]];
'.

	self assert: parameters asCmajorListOfUIEndpoints equals: result
]

{ #category : 'tests' }
UtilitiesTest >> testDictionaryAsCmajorPolyWrapper [

	| parameters attack decay release sustain level freq gain gate result |
	parameters := Dictionary new.
	attack := Dictionary new.
		          attack add: #address -> '/MyApp/ADSREnvAttack';
		          add: #init -> 0.001;
		          add: #label -> 'ADSREnvAttack';
		          add: #max -> 2;
		          add: #min -> 0.001;
		          add: #shortname -> 'ADSREnvAttack';
		          add: #step -> 1;
		          add: #type -> 'hslider'.
	decay := Dictionary new.
		         decay add: #address -> '/MyApp/ADSREnvDecay';
		         add: #init -> 0.2;
		         add: #label -> 'ADSREnvDecay';
		         add: #max -> 2;
		         add: #min -> 0.001;
		         add: #shortname -> 'ADSREnvDecay';
		         add: #step -> 1;
		         add: #type -> 'hslider'.

	release := Dictionary new.
		          release add: #address -> '/MyApp/ADSREnvRelease';
		           add: #init -> 0.3;
		           add: #label -> 'ADSREnvRelease';
		           add: #max -> 3;
		           add: #min -> 0;
		           add: #shortname -> 'ADSREnvRelease';
		           add: #step -> 0.001;
		           add: #type -> 'hslider'.

	sustain := Dictionary new.
		          sustain  add: #address -> '/MyApp/ADSREnvSustain';
		           add: #init -> 0.5;
		           add: #label -> 'ADSREnvSustain';
		           add: #max -> 1;
		           add: #min -> 0;
		           add: #shortname -> 'ADSREnvSustain';
		           add: #step -> 0.001;
		           add: #type -> 'hslider'.

	level := Dictionary new.
		        level add: #address -> '/MyApp/ADSREnvuLevel';
		         add: #init -> 0.5;
		         add: #label -> 'ADSREnvuLevel';
		         add: #max -> 1;
		         add: #min -> 0;
		         add: #shortname -> 'ADSREnvuLevel';
		         add: #step -> 0.001;
		         add: #type -> 'hslider'.

	freq := Dictionary new.
		       freq add: #address -> '/MyApp/freq';
		        add: #init -> 200;
		        add: #label -> 'freq';
		        add: #max -> 1200;
		        add: #min -> 20;
		        add: #shortname -> 'freq';
		        add: #step -> 1;
		        add: #type -> 'hslider'.

	gain := Dictionary new.
	gain
		add: #address -> '/MyApp/gain';
		add: #init -> 0.5;
		add: #label -> 'gain';
		add: #max -> 1;
		add: #min -> 0;
		add: #shortname -> 'gain';
		add: #step -> 0.01;
		add: #type -> 'hslider'.

	gate := Dictionary new.
	gate
		add: #address -> '/MyApp/gate';
		add: #label -> 'gate';
		add: #shortname -> 'gate';
		add: #type -> 'button'.

	parameters add: #ADSREnvAttack -> attack.
	parameters add: #ADSREnvDecay -> decay.
	parameters add: #ADSREnvRelease -> release.
	parameters add: #ADSREnvSustain -> sustain.
	parameters add: #ADSREnvuLevel -> level.

	result := 'graph Synth [[ main ]]
{
input event std::midi::Message midiIn [[ name: "MIDI input" ]];
input event float32 event_ADSREnvuLevel [[ name: "ADSREnvuLevel", group: "/v:MyApp/ADSREnvuLevel", min: 0.0f, max: 1.0f, init: 0.5f, step: 0.001f ]];
input event float32 event_ADSREnvRelease [[ name: "ADSREnvRelease", group: "/v:MyApp/ADSREnvRelease", min: 0.0f, max: 3.0f, init: 0.3f, step: 0.001f ]];
input event float32 event_ADSREnvAttack [[ name: "ADSREnvAttack", group: "/v:MyApp/ADSREnvAttack", min: 0.001f, max: 2.0f, init: 0.001f, step: 1.0f ]];
input event float32 event_ADSREnvSustain [[ name: "ADSREnvSustain", group: "/v:MyApp/ADSREnvSustain", min: 0.0f, max: 1.0f, init: 0.5f, step: 0.001f ]];
input event float32 event_ADSREnvDecay [[ name: "ADSREnvDecay", group: "/v:MyApp/ADSREnvDecay", min: 0.001f, max: 2.0f, init: 0.2f, step: 1.0f ]];

output stream float<2> out;

let voiceCount = 16;

node
{
voiceAllocator = std::voices::VoiceAllocator (voiceCount);
voices = Voice[voiceCount];
}

    connection
    {
        event_ADSREnvAttack -> voices.event_ADSREnvAttack;
        event_ADSREnvDecay -> voices.event_ADSREnvDecay;
        event_ADSREnvRelease -> voices.event_ADSREnvRelease;
        event_ADSREnvSustain -> voices.event_ADSREnvSustain;
        event_ADSREnvuLevel -> voices.event_ADSREnvuLevel;

        midiIn -> std::midi::MPEConverter -> voiceAllocator -> voices.eventIn;
        voices.out -> out;

    }
}

graph Voice
{
    input event (std::notes::NoteOn, std::notes::NoteOff) eventIn;
    input dsp.*;

    output stream float<2> out;

    node
    {
        noteToFaust = NoteToFaust;
        dsp = faust::example;
    }

    connection
    {
        eventIn -> noteToFaust.eventIn;

        noteToFaust.gate     -> dsp.event_gate;
        noteToFaust.velocity -> dsp.event_gain;
        noteToFaust.freq     -> dsp.event_freq;

        float<2> (dsp.output0, dsp.output1) -> out;
    }
}

processor NoteToFaust
{
    input event (std::notes::NoteOn, std::notes::NoteOff) eventIn;

    output event float freq, gate, velocity;

    event eventIn (std::notes::NoteOn e)
    {
        freq <- std::notes::noteToFrequency (e.pitch);
        gate <- 1.0f;
        velocity <- e.velocity;
    }

    event eventIn (std::notes::NoteOff e)
    {
        gate <- 0.0f;
    }
}'.
	^ self assert: parameters asCmajorPolyWrapper equals: result
]

{ #category : 'tests' }
UtilitiesTest >> testDictionaryAsEventsToVoicesConnections [

	| result dict |
	result := 'event_ADSREnvuLevel -> voices.event_ADSREnvuLevel;
event_ADSREnvRelease -> voices.event_ADSREnvRelease;
event_ADSREnvAttack -> voices.event_ADSREnvAttack;
event_ADSREnvSustain -> voices.event_ADSREnvSustain;
event_ADSREnvDecay -> voices.event_ADSREnvDecay;
'.

	dict := Dictionary new.
	dict
		add: #ADSREnvAttack -> 0;
		add: #ADSREnvDecay -> 0;
		add: #ADSREnvSustain -> 0;
		add: #ADSREnvRelease -> 0;
		add: #ADSREnvuLevel -> 0.
	self assert: dict asCmajorEventsToVoicesConnection equals: result
]
