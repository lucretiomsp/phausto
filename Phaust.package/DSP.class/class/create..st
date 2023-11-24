as yet unclassified
create: aStringWithFaustCode
"create a new dsp from a string with valid Faust code"
| currentDsp |
currentDsp := FaustDynamicEngine uniqueInstance createDsp: aStringWithFaustCode.
currentDsp name: FaustDynamicEngine uniqueInstance defaultName.
^ currentDsp 