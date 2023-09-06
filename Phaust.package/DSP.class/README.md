Opaque structure representing a DSP object.
The DSP object describes the sound being played.
Create a new DSP with DSP create: aSTringWithAValidFaustProgram, for example:
myDsp = DSP create: ''import("stdfaust.lib"); process = os.osc(400)'.

Then initialize the dsp
myDsp init.

Start the sound
myDsp start.

Stop the sound:
myDsp stop.
