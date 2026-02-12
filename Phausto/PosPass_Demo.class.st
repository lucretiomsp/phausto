"
Use Positive-Pass Filter pospass() to frequency-shift a sine tone. First, a real sinusoid is converted to its analytic-signal form using pospass() to filter out its negative frequency component. Next, it is multiplied by a modulating complex sinusoid at the shifting frequency to create the frequency-shifted result. The real and imaginary parts are output to channels 1 & 2. For a more interesting frequency-shifting example, check the ""Use Mic"" checkbox to replace the input sinusoid by mic input. Note that frequency shifting is not the same as frequency scaling. A frequency-shifted harmonic signal is usually not harmonic. Very small frequency shifts give interesting chirp effects when there is feedback around the frequency shifter.
"
Class {
	#name : 'PosPass_Demo',
	#superclass : 'PhDemosMono',
	#category : 'Phausto-Demo',
	#package : 'Phausto',
	#tag : 'Demo'
}
