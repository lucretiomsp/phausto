"
Super class to create Cmajor patches
The class variable _parentFolder_ allows to change the destination folder for the created patches
"
Class {
	#name : 'CmajorPatch',
	#superclass : 'Object',
	#instVars : [
		'name',
		'dsp'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'converting' }
CmajorPatch class >> asCmajorPatchFileNamed: aName [

	| hasMidi cmajorPatchesDir patchDir|
	"we need to improve the mechanism to generate MIDI instruments"
	hasMidi := 'false,'.

	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
		patchDir := (cmajorPatchesDir / aName	) ensureCreateDirectory.
	(patchDir / (aName , '.cmajorpatch')) writeStream
		cr;
		nextPutAll: '{';
		nextPutAll: '"CmajorVersion":';
		tab;
		nextPutAll: '1,';
		cr;
		nextPutAll: '"ID":';
		tab;
		nextPutAll: '"pharo.' , aName , '",';
		cr;
		nextPutAll: '"version":';
		tab;
		nextPutAll: '"1.0",';
		cr;
		nextPutAll: '"name":';
		tab;
		nextPutAll: '"' , aName , '"' , ',';
		cr;
		nextPutAll: '"description":';
		tab;
		nextPutAll: '"A ' , aName , ' generated in Pharo using Phausto",';
		cr;
		nextPutAll: '"manufacturer":';
		tab;
		nextPutAll: '"Pharo Association",';
		cr;
		nextPutAll: '"isInstrument":';
		tab;
		nextPutAll: hasMidi;
		cr;
		nextPutAll: '"source":';
		tab;
		nextPutAll: '"' , aName , '.cmajor"';
		cr;
		nextPutAll: '}';
		close
]

{ #category : 'converting' }
CmajorPatch class >> asCmajorPatchFileNamed: aName hasMIDI: aBoolean [

	| hasMidi cmajorPatchesDir patchDir cmajorPatchFile polyWrapperString |
	"we need to improve the mechanism to generate MIDI instruments"
	hasMidi := aBoolean asString , ','.
	polyWrapperString := ''.
	aBoolean ifTrue: [
		polyWrapperString :=  '"' , aName , 'polyWrapper' , '.cmajor",' ].
	"we create the cmajorPatches folder in the documents folder if it not exists"
	cmajorPatchesDir := (FileLocator documents / 'cmajorPatches')
		                    ensureCreateDirectory.
	patchDir := (cmajorPatchesDir / aName) ensureCreateDirectory.

	cmajorPatchFile := patchDir / (aName , '.cmajorpatch').
	"delete the file if the file already exists and create another one. maybe should we ask for overwrite?"
	cmajorPatchFile exists ifTrue: [ cmajorPatchFile delete ].
	cmajorPatchFile writeStream
		cr;
		nextPutAll: '{';
		nextPutAll: '"CmajorVersion":';
		tab;
		nextPutAll: '1,';
		cr;
		nextPutAll: '"ID":';
		tab;
		nextPutAll: '"pharo.' , aName , '",';
		cr;
		nextPutAll: '"version":';
		tab;
		nextPutAll: '"1.0",';
		cr;
		nextPutAll: '"name":';
		tab;
		nextPutAll: '"' , aName , '"' , ',';
		cr;
		nextPutAll: '"description":';
		tab;
		nextPutAll: '"A ' , aName , ' generated in Pharo using Phausto",';
		cr;
		nextPutAll: '"manufacturer":';
		tab;
		nextPutAll: '"Pharo Association",';
		cr;
		nextPutAll: '"isInstrument":';
		tab;
		nextPutAll: hasMidi;
		cr;
		nextPutAll: '"source":';
		tab;
		nextPutAll: '[';
		nextPutAll: polyWrapperString;
		nextPutAll: ' "' , aName , '.cmajor" ]';
		cr;
		nextPutAll: '}';
		close
]

{ #category : 'as yet unclassified' }
CmajorPatch class >> parentFolder [

^ FileLocator documents / 'cmajorPatches'
]

{ #category : 'ui' }
CmajorPatch >> createIndexJs [

	| file location |
	location := (self folder / 'ui') ensureCreateDirectory .
	file := (location / 'index.js' )ensureCreateFile .
	file writeStream nextPutAll:  '// modification of index.js from the Tremolo patch of Cmajor github examples
// import { createView } from "./stompbox/minimalView.js";
import { createBackground, createSmallKnobDiv } from "./assets/viewHelper.js";

import { knobConfigs} from "./uiConfigs.js";
;
import { bgConfig} from "./uiConfigs.js";

export default function createPatchView (patchConnection)
{
    const container = document.createElement ("div");
    
    const clear = () => container.innerHTML = "";

    patchConnection.addStatusListener ((status) =>
    {
        clear();

        const toParameter = (endpointIDToFind) => {
            const endpointInfo = status?.details?.inputs?.find(
                ({ endpointID }) => endpointID === endpointIDToFind
            );

            const { endpointID } = endpointInfo;

            return {
                min: endpointInfo?.annotation?.min,
                max: endpointInfo?.annotation?.max,
                initialValue: endpointInfo?.annotation?.init,
                onBeginEdit: () =>
                    patchConnection.sendParameterGestureStart(endpointID),
                onEdit: (nextValue) =>
                    patchConnection.sendEventOrValue(endpointID, nextValue),
                onEndEdit: () =>
                    patchConnection.sendParameterGestureEnd(endpointID),
                subscribe: (listener) => {
                    patchConnection.addParameterListener(endpointID, listener);
                    patchConnection.requestParameterValue(endpointID);
                    return () =>
                        patchConnection.removeParameterListener(
                            endpointID,
                            listener
                        );
                },
            };
        };

      
// add Background


// loop over knobConfigs
const  background = createBackground(bgConfig);
container.appendChild(background);

    

        knobConfigs.forEach((cfg) => {
            const param = toParameter(cfg.endpointID);

            const skd = createSmallKnobDiv(param, {
                left: cfg.left,
                top: cfg.top,
                width: cfg.width,
                height: cfg.height,
                image: cfg.image,
            });

            container.appendChild(skd.elm);

            // subscribe knob to backend updates
            param.subscribe(skd.update);
        });
    



        // create knob bound to "rate" parameter
        // const rateParam = toParameter("rate");
        // const myKnob = createSmallKnobDiv(rateParam);
        // container.appendChild(myKnob.elm);

        // subscribe knob to parameter updates (UI follows DSP state)
        // rateParam.subscribe(myKnob.update);
    




    });

    patchConnection.requestStatusUpdate();

    return container;
}

'; close.
]

{ #category : 'api - exporting' }
CmajorPatch >> dsp [ 

^ dsp
]

{ #category : 'accessing' }
CmajorPatch >> dsp: aDsp [

	dsp := aDsp 
]

{ #category : 'api - exporting' }
CmajorPatch >> export [ 
self subclassResponsibility 
]

{ #category : 'accessing' }
CmajorPatch >> folder [

	^ FileLocator documents / 'cmajorPatches'
	  / (self name )
]

{ #category : 'api - exporting' }
CmajorPatch >> name [ 
^ name
]

{ #category : 'accessing' }
CmajorPatch >> name: aString [

name := aString
]
