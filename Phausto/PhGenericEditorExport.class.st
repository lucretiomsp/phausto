"
I export the default JUCE editor: one labelled control per APVTS parameter, one row each.

The generated C++ iterates PhaustoParams::table at runtime: a rotary Slider with a SliderAttachment for continuous controls, a ToggleButton with a ButtonAttachment for buttons and checkboxes. The editor reads the same table that builds the parameter layout, so widgets and parameters cannot diverge, and adding a control in Faust needs no change here.

The attachment arrays are declared after the controls they listen to, so they are destroyed first. Keep that order if you edit the header template.

My files are generated and overwritten on every export. For a hand-written UI, use PhSkeletonEditorExport.


Usage:
```language=Pharo
	dsp export2JuceWithName: 'Delay' type: PhEffectPluginType new editor: PhGenericEditorExport new
```
"
Class {
	#name : 'PhGenericEditorExport',
	#superclass : 'PhEditorExport',
	#category : 'Phausto-Exporting',
	#package : 'Phausto',
	#tag : 'Exporting'
}

{ #category : 'template method' }
PhGenericEditorExport >> headerFor: aPluginType [

	| proc editor |
	proc := aPluginType typeName , 'AudioProcessor'.
	editor := proc , 'Editor'.
	^ '#pragma once
#include <JuceHeader.h>
#include "PluginProcessor.h"

class ' , editor , ' : public juce::AudioProcessorEditor
{
public:
    ' , editor , ' (' , proc , '&);
    ~' , editor , '() override;

    void paint (juce::Graphics&) override;
    void resized() override;

private:
    ' , proc , '& audioProcessor;

    juce::OwnedArray<juce::Label> labels;
    juce::OwnedArray<juce::Component> controls;
    juce::OwnedArray<juce::AudioProcessorValueTreeState::SliderAttachment> sliderAttachments;
    juce::OwnedArray<juce::AudioProcessorValueTreeState::ButtonAttachment> buttonAttachments;

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR (' , editor , ')
};
'
]

{ #category : 'template method' }
PhGenericEditorExport >> implementationFor: aPluginType [
	"Iterates PhaustoParams::table, so the attachments cannot diverge
	 from the layout that created the parameters."

	| proc editor |
	proc := aPluginType typeName , 'AudioProcessor'.
	editor := proc , 'Editor'.
	^ '#include "PluginProcessor.h"
#include "PluginEditor.h"

' , editor , '::' , editor , ' (' , proc , '& p)
    : AudioProcessorEditor (&p), audioProcessor (p)
{
    for (auto& d : PhaustoParams::table)
    {
        if (d.isToggle)
        {
            auto* tb = new juce::ToggleButton ();
            addAndMakeVisible (tb);
            buttonAttachments.add (new juce::AudioProcessorValueTreeState::ButtonAttachment (
                audioProcessor.apvts, d.id, *tb));
            controls.add (tb);
        }
        else
        {
            auto* sl = new juce::Slider (juce::Slider::RotaryHorizontalVerticalDrag,
                                         juce::Slider::TextBoxBelow);
            addAndMakeVisible (sl);
            sliderAttachments.add (new juce::AudioProcessorValueTreeState::SliderAttachment (
                audioProcessor.apvts, d.id, *sl));
            controls.add (sl);
        }

        labels.add (new juce::Label ({}, d.label));
        addAndMakeVisible (labels.getLast());
        labels.getLast()->setJustificationType (juce::Justification::centredRight);
    }

    setSize (380, juce::jmax (1, controls.size()) * 64 + 24);
}

' , editor , '::~' , editor , '() {}

void ' , editor , '::paint (juce::Graphics& g)
{
    g.fillAll (getLookAndFeel().findColour (juce::ResizableWindow::backgroundColourId));
}

void ' , editor , '::resized()
{
    auto area = getLocalBounds().reduced (12);
    const int rowH = 64;
    for (int i = 0; i < controls.size(); ++i)
    {
        auto row = area.removeFromTop (rowH);
        labels[i]->setBounds (row.removeFromLeft (150));
        controls[i]->setBounds (row.reduced (4));
    }
}
'
]
