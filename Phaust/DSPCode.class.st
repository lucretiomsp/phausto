"
Convenience class to store useful Faust DSP as string. DSP code as string can be retired by sending message to the class.
"
Class {
	#name : #DSPCode,
	#superclass : #Object,
	#category : #Phaust
}

{ #category : #'as yet unclassified' }
DSPCode class >> basicHiHatFM [

^
'import("stdfaust.lib");

gate = button("Gate");
opADecay = vslider("Decay", 0.31, 0.1, 5, 0.01);
envA = en.ar(0.001, opADecay, gate);
carFreq = 440;


opA = os.osc(carFreq + opB);

opB = os.osc(carFreq +732 + opC) * opBLevel * envB;
envB = en.ar(0.001, 0.31, gate);
opBLevel = vslider("opBLevel", 5800, 0, 5800, 0.001);

opC  = os.osc(carFreq + 349 + opD  ) * opCLevel * envC;
envC = en.ar(0.001, 0.21, gate);
opCLevel = vslider("opCLevel", 1580, 0, 6316, 0.01);

opD  = os.osc(carFreq + 689) * opDLevel * envD;
envD = en.ar(0.001, 0.16, gate);
opDLevel = vslider("opDLevel", 264, 0, 3860, 0.01);

volume = vslider("Volume", 0.1 , 0 , 4, 0.01);

hihatFM = (opA * envA * volume) : fi.highpass(2, 3200) <: _ , _;

process = hgroup("HiHat-FM", hihatFM);
'
]

{ #category : #'accessing - data' }
DSPCode class >> basicKickWithADSR [
^ 
'
import("stdfaust.lib"); 

// this is a simple virtual analog kick drum with a quadratic distortion
note = vslider("kickNote", 60, 24, 88, 1);


gate = button("kickGate");
ampEnvelope = en.adsr(0.001, 0.18, 0, 0.20, gate);

pitchEnvelope = en.adsr(0.001, 0.18, 0, 0.20, gate);
volume = hslider("kickVolume", 0.6, 0, 1, 0.01);

pitchEnvAmount = vslider("kickBend", 36, 0.1, 48, 1);
pitchBend = pitchEnvelope * pitchEnvAmount;
// note must be transposed down
freq = ba.midikey2hz(note -36 + pitchBend);

oscillator = os.osc(freq);

kick =   (((oscillator * ampEnvelope) * volume) : ef.softclipQuadratic )<: _ , _;
process = kick;'
]

{ #category : #'as yet unclassified' }
DSPCode class >> drumMachine7 [

^
'
import ("stdfaust.lib");
import("phaustoStandard.lib");

numChannels  = 7;
mixer8 = par (i, numChannels, _ ) :> _ <: _, _;
drum = (psynth.basicKick , psynth.elementaryClap , psynth.clave , psynth.hiHatFM, psynth.basicSnare, psynth.basicDjembe , psynth.dubdub) : mixer8;

process = drum;'
]

{ #category : #'as yet unclassified' }
DSPCode class >> drumMachine8 [
	" essential drum machine with extra basic sawtoot synth named dubdub and dirty 303 cassline clone"

	^ '
import ("stdfaust.lib");
import("phaustoStandard.lib");

numChannels  = 8;
mixer8 = par (i, numChannels, _ ) :> _ <: _, _;
drum = (psynth.basicKick , psynth.elementaryClap , psynth.clave , psynth.hiHatFM, psynth.basicSnare, psynth.basicDjembe , psynth.dubdub, psynth.acidBasic) : mixer8;

process = drum;'
]
