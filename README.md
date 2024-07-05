# phausto
Phausto is a library and API that allows to use the [FAUST](https://faust.grame.fr/) compiler and its libraries  (Functional Audio Stream) inside [Pharo](https://pharo.org/)

## How to install

#### First, download the Phausto libraries for your platform, open the package, and place the librariesBundle folder into documents/Pharo/images/yourPhaustimage/
Then, copy and execute in a Playground
```Smalltalk
Metacello new
    baseline: 'Phausto';
    repository: 'github://lucretiomsp/phausto:main';
    load
```

## Create a DSP from a valid string of FAUST code

```Smalltalk
"This content is Faust code inside a string"
content := 'import("stdfaust.lib"); 
tempo = hslider("tempo", 10000, 300, 20000, 100);
freq = hslider("freq", 300, 200, 900, 100);
process = ba.pulsen(1, tempo) : pm.djembe(freq, 0.3, 0.4, 1) <: dm.freeverb_demo;'.

"Create the DSP"
x1 := DSP create: content.
"Initialise the DSP"
x1 init.
"Start the DSP"
x1 start.

"If you want to change the parmeters, create faders and open them"
s := x1 sliderFor: 'tempo'.
s openInWindow.

s2 := x1 sliderFor: 'freq'.
s2 openInWindow 

s3 := x1 sliderFor: 'Freeverb/0x00/RoomSize'.
s3 openInWindow .

" and when you want to stop the sound" 
x1 stop.
```
 
## Hello Phausto
```Smalltalk
"create a Sine wave Oscillator"
sine := SineOsc new.
"creates a stereo DSP from the Oscillator"
dsp := sine stereo asDsp.
"initialize the DSP"
dsp init.
"start the sound"
dsp start.
"stop the sound"
dsp stop.
"destroy the dsp when you no longer need it"
dsp destroy.
```
## Get Funky
```Smalltalk
“Create two pulse generators, the first has its period changed by a LowFrequency Oscillator”
pulse1 := Pulsen new period: (LFOTriPos new freq: 0.2; offset: 0.05; amount: 4) .
pulse2 := Pulsen new period: 0.35.
“Create a djembe, triggered by pulse1”
djembe := Djembe new trigger: pulse1.
marimbaFreq := LFORandomPos new offset: 20; amount: 600; freq: (1 /0.35).
“Create a marimba, triggered by pulse2 and with the frequency modulated by an LFO with a random shape”
marimba := Marimba new trigger: pulse2; freq: marimbaFreq .
“Sum the marimba and the djembe patch them to a GreyHoleDW reverb and creates a dsp”
"The ChucK operator =>  it is our playful homage to the creators of ChucK, it simplfies and abstract the connections between Unit Generators"
dsp := djembe + marimba => GreyHole new) stereo asDsp.

dsp init.
dsp start.
dsp stop.
``` Smalltalk


