# phausto
Phausto is a library and API that allows to use the [FAUST](https://faust.grame.fr/) compiler and its libraries  (Functional Audio Stream) inside [Pharo](https://pharo.org/)

## How to install

#### First, download the packed faustLibraries for your platform, open the package, and copy of the librariesBundle folder into documents/Pharo/images/yourPhaustimage/
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
 
