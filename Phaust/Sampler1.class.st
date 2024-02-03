"
A basic sample player with trig
"
Class {
	#name : #Sampler1,
	#superclass : #SamplePlayers,
	#instVars : [
		'debugPath'
	],
	#category : #'Phaust-ToolKit'
}

{ #category : #converting }
Sampler1 >> asBox [

	| code intermediateBox |
	code := 'import("stdfaust.lib");
rst = button("reset");
resetter = _ , 0 : select2(rst);
reader = resetter~+(1) ;
process = 0,reader:soundfile("son[url:{''' , self pathToFile
	        , '''}]",2): ! , ! , _ ,_ ;'.

	debugPath := 'process = 0,reader:soundfile("son[url:{'' '
	             , self pathToFile , '''}]",2): ! , ! , _ ,_ ;'.
	intermediateBox := BoxAPI uniqueInstance
		                   boxFromString: code
		                   inputs: self inputs
		                   outputs: self outputs
		                   buffer: self errorBuffer.

	^ intermediateBox
]
