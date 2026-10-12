Class {
	#name : 'PhSkeletonEditorExport',
	#superclass : 'PhEditorExport',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'template method' }
PhSkeletonEditorExport >> headerFor: aPluginType [

	^ '#pragma once

#include <JuceHeader.h>
#include "PluginProcessor.h"

// Created once by Phausto as a starting point.
// This file is yours: re-exporting the plugin never overwrites it.
// Parameters live in audioProcessor.apvts; their ids are in PhaustoParams.h.

class XXXAudioProcessorEditor : public juce::AudioProcessorEditor
{
public:
    explicit XXXAudioProcessorEditor (XXXAudioProcessor&);
    ~XXXAudioProcessorEditor() override;

    void paint (juce::Graphics&) override;
    void resized() override;

private:
    XXXAudioProcessor& audioProcessor;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (XXXAudioProcessorEditor)
};
' copyReplaceAll: 'XXX' with: aPluginType typeName
]

{ #category : 'template method' }
PhSkeletonEditorExport >> mplementationFor: aPluginType [

	^ '#include "PluginProcessor.h"
#include "PluginEditor.h"

XXXAudioProcessorEditor::XXXAudioProcessorEditor (XXXAudioProcessor& p)
    : AudioProcessorEditor (&p), audioProcessor (p)
{
    setSize (800, 100);
}

XXXAudioProcessorEditor::~XXXAudioProcessorEditor() = default;

void XXXAudioProcessorEditor::paint (juce::Graphics& g)
{
    g.fillAll (getLookAndFeel().findColour (juce::ResizableWindow::backgroundColourId));
}

void XXXAudioProcessorEditor::resized()
{
}
' copyReplaceAll: 'XXX' with: aPluginType typeName
]

{ #category : 'template method' }
PhSkeletonEditorExport >> write: aString to: aFileReference [
	"The user owns these files: never overwrite."

	aFileReference exists ifTrue: [ ^ self ].
	super write: aString to: aFileReference
]
