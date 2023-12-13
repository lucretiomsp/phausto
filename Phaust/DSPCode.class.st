"
Convenience class to store useful Faust DSP as string. DSP code as string can be retired by sending message to the class.
"
Class {
	#name : #DSPCode,
	#superclass : #Object,
	#category : #Phaust
}

{ #category : #'accessing - data' }
DSPCode class >> basicKickWithADSR [

^
'
import("stdfaust.lib"); 

// this is a simple virtual analog kick drum with a quadratic distortion
note = vslider("KickNote", 60, 24, 88, 1);


gate = button("KickGate");
ampEnvelope = en.adsr(0.001, 0.18, 0, 0.20, gate);

pitchEnvelope = en.adsr(0.001, 0.18, 0, 0.20, gate);
volume = hslider("Kickolume", 0.6, 0, 1, 0.01);

pitchEnvAmount = vslider("KickBend", 36, 0.1, 48, 1);
pitchBend = pitchEnvelope * pitchEnvAmount;
// note must be transposed down
freq = ba.midikey2hz(note -36 + pitchBend);

oscillator = os.osc(freq);

process = (((oscillator * ampEnvelope) * volume) : ef.softclipQuadratic )<: _ , _;'
]
