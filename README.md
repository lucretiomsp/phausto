# phaust
Use the [Faust](https://faust.grame.fr/) (Functional Audio Stream) functional programming language for sound synthesis inside [Pharo](https://pharo.org/)

## Requirements
### Only working for Mac Silicon at the moment!
### Clone tis repo in Pharo with ICeberg and load the Phaust package
#### A copy of the librariesBundle must be copied in your documents/Pharo/images/yourPhaustimage

## Example code

```Smalltalk

“ This content is Faust code inside a string”
content := 'import("stdfaust.lib"); 
tempo = hslider("tempo", 10000, 300, 20000, 100);
freq = hslider("freq", 300, 200, 900, 100);
process = ba.pulsen(1, tempo) : pm.djembe(freq, 0.3, 0.4, 1) <: dm.freeverb_demo;'.

“Create the DSP”
x1 := DSP create: content.
“Initialise the DSP”
x1 init.
“Start the DSP”
x1 start.

"if you want to change the parmeters, create faders and open them”
s := x1 sliderFor: 'tempo'.
s openInWindow.

s2 := x1 sliderFor: 'freq'.
s2 openInWindow 

s3 := x1 sliderFor: 'Freeverb/0x00/RoomSize'.
s3 openInWindow .

" and when you want to stop the sound"
x1 stop.
 
