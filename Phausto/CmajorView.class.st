"
I am an helper class to create a simple GUI for a Cmajor exported patch
"
Class {
	#name : 'CmajorView',
	#superclass : 'Object',
	#instVars : [
		'folder',
		'background',
		'knobs',
		'buttons',
		'faders',
		'patchView',
		'size',
		'isResizable'
	],
	#category : 'Phausto-Cmajor',
	#package : 'Phausto',
	#tag : 'Cmajor'
}

{ #category : 'adding' }
CmajorView >> addTo: aCmajorPatch [

	| patchFolder patchFilePath patchFileWithGUI |

	patchFolder := aCmajorPatch name.
	patchFilePath := patchFolder , '.cmajorPatch'.
	self folder: patchFolder.
	
	patchFileWithGUI := (aCmajorPatch folder / patchFilePath) contents addViewPropertyFrom: self .
	
   (CmajorPatch parentFolder  / patchFolder / patchFilePath) writeStream nextPutAll: patchFileWithGUI; close .
	aCmajorPatch createIndexJs.
	self
		writeViewHelperJS;
		writeBackgroundVariableToConfig;
		writeKnobsVariableToConfig
]

{ #category : 'accessing' }
CmajorView >> background [

	^ background
]

{ #category : 'accessing' }
CmajorView >> background: aDictionary [

	background := aDictionary
]

{ #category : 'accessing' }
CmajorView >> buttons [

	^ buttons
]

{ #category : 'accessing' }
CmajorView >> buttons: anObject [

	buttons := anObject
]

{ #category : 'accessing' }
CmajorView >> faders [

	^ faders
]

{ #category : 'accessing' }
CmajorView >> faders: anObject [

	faders := anObject
]

{ #category : 'accessing' }
CmajorView >> folder [

	^ folder
]

{ #category : 'accessing' }
CmajorView >> folder: aString [

	folder := aString
]

{ #category : 'initialization' }
CmajorView >> initialize [

	super initialize.
	knobs := OrderedCollection new.
	isResizable := true.
	size := 400 @ 400
]

{ #category : 'accessing' }
CmajorView >> isResizable [

^ isResizable 
]

{ #category : 'accessing' }
CmajorView >> isResizable: aBoolean [

isResizable := aBoolean 
]

{ #category : 'accessing' }
CmajorView >> knobs [

	^ knobs
]

{ #category : 'accessing' }
CmajorView >> knobs: anObject [

	knobs := anObject
]

{ #category : 'accessing' }
CmajorView >> patchView [

	^ patchView
]

{ #category : 'properties' }
CmajorView >> patchViewProperty [

	^ 'view' -> {
		  ('src' -> 'ui/index.js').
		  ('width' -> self size x).
		  ('height' -> self size y).
		  ('resizable' -> self isResizable ) } asDictionary
]

{ #category : 'accessing' }
CmajorView >> size [ 
^ size
]

{ #category : 'accessing' }
CmajorView >> size: aPoint [
"width@height"
	size := aPoint
]

{ #category : 'accessing' }
CmajorView >> uiConfigFileLocator [

| location file |
location := (CmajorPatch parentFolder / self folder / 'ui' )
		            ensureCreateDirectory.
	file := (location / 'uiConfig.js') ensureCreateFile .
	^ file
]

{ #category : 'writing' }
CmajorView >> writeBackgroundVariableToConfig [

	self uiConfigFileLocator writeStream setToEnd 
		nextPutAll: ' export const  bgConfig = ';
		nextPutAll: self background asJsObjectString;
		close
]

{ #category : 'writing' }
CmajorView >> writeKnobsVariableToConfig [

	| knobsInsideArray  |
	knobsInsideArray := String new writeStream.
	self knobs do: [ :i |
			knobsInsideArray
				nextPutAll: i asJsObjectString;
				nextPutAll: ' , ';
				cr ].

	self uiConfigFileLocator writeStream setToEnd
		nextPutAll: 'export const knobConfigs = [ ';
		cr;
		nextPutAll: (knobsInsideArray contents allButLast: 2);
		nextPutAll: ' ];';
		close
]

{ #category : 'writing' }
CmajorView >> writeViewHelperJS [

| location file |
location := (CmajorPatch parentFolder / self folder / 'ui' / 'assets')
		            ensureCreateDirectory.
	file := (location / 'viewHelper.js') ensureCreateFile.
	file	writeStream nextPutAll: ' 
		// modification of view.js from the Tremolo patch of Cmajor github examples

// needed functions
function setValueAsGesture (value, { onBeginEdit, onEdit, onEndEdit })
{
    onBeginEdit?.();
    onEdit?.(value);
    onEndEdit?.();
}

function toStatefulEditCallback (controlled, onEdit, update)
{
    if (controlled)
        return onEdit;

    return (nextValue) =>
    {
        onEdit?.(nextValue);
        update?.(nextValue);
    };
}
/// make ROTATABLE
export function makeRotatable ({
    initialValue,
    min = 0,
    max = 1,
    onBeginEdit = () => {},
    onEdit = () => {},
    onEndEdit = () => {},
    maxRotation = 132,
    element,
    controlled = true,
} = {})
{
    initialValue = initialValue ?? min;

    const remap = (source, sourceFrom, sourceTo, targetFrom, targetTo) =>
    {
        return targetFrom + (source - sourceFrom) * (targetTo - targetFrom) / (sourceTo - sourceFrom);
    };

    const toValue = (knobRotation) => remap (knobRotation, -maxRotation, maxRotation, min, max);
    const toRotation = (value) => remap (value, min, max, -maxRotation, maxRotation);

    const state =
    {
        rotation: undefined,
    };

    const update = (nextValue, force) =>
    {
        const degrees = toRotation (nextValue);

        if (! force && state.rotation === degrees)
            return;

        state.rotation = degrees;
        element.style.transform = `rotate(${degrees}deg)`
    };

    onEdit = toStatefulEditCallback (controlled, onEdit, update);

    const force = true;
    update (initialValue, force);

    let accumulatedRotation, touchIdentifier, previousClientY;

    const nextRotation = (rotation, delta) =>
    {
        const clamp = (v, min, max) => Math.min (Math.max (v, min), max);
        return clamp (rotation - delta, -maxRotation, maxRotation);
    };

    const onMouseMove = (event) =>
    {
        event.preventDefault(); // avoid scrolling whilst dragging
        const speedMultiplier = event.shiftKey ? 0.25 : 1.5;
        accumulatedRotation = nextRotation (accumulatedRotation, event.movementY * speedMultiplier);
        onEdit?.(toValue (accumulatedRotation));
    };

    const onMouseUp = () =>
    {
        accumulatedRotation = undefined;
        window.removeEventListener ("mousemove", onMouseMove);
        window.removeEventListener ("mouseup", onMouseUp);
        onEndEdit?.();
    };

    const onMouseDown = () =>
    {
        accumulatedRotation = state.rotation;
        onBeginEdit?.();
        window.addEventListener ("mousemove", onMouseMove);
        window.addEventListener ("mouseup", onMouseUp);
    };

    const onTouchMove = (event) =>
    {
        for (const touch of event.changedTouches)
        {
            if (touch.identifier == touchIdentifier)
            {
                event.preventDefault(); // avoid scrolling whilst dragging
                const speedMultiplier = event.shiftKey ? 0.25 : 1.5;
                const movementY = touch.clientY - previousClientY;
                previousClientY = touch.clientY;
                accumulatedRotation = nextRotation (accumulatedRotation, movementY * speedMultiplier);
                onEdit?.(toValue (accumulatedRotation));
            }
        }
    };

    const onTouchStart = (event) =>
    {
        accumulatedRotation = state.rotation;
        previousClientY = event.changedTouches[0].clientY
        touchIdentifier = event.changedTouches[0].identifier;
        onBeginEdit?.();
        window.addEventListener ("touchmove", onTouchMove);
        window.addEventListener ("touchend", onTouchEnd);
        event.preventDefault();
    };

    const onTouchEnd = (event) =>
    {
        previousClientY = undefined;
        accumulatedRotation = undefined;
        window.removeEventListener ("touchmove", onTouchMove);
        window.removeEventListener ("touchend", onTouchEnd);
        onEndEdit?.();
        event.preventDefault();
    };

    const onReset = () => setValueAsGesture (initialValue, { onBeginEdit, onEdit, onEndEdit });

    element.addEventListener ("mousedown", onMouseDown);
    element.addEventListener ("dblclick", onReset);
    element.addEventListener (''touchstart'', onTouchStart);

    return update;
}

function resolvePath (path)
{
    return new URL (path, import.meta.url);
}

export function createSmallKnobDiv(parameter, { 
    left = 0, 
    top = 0, 
    width = 70, 
    height = 70,  
    image = "./big-knob-flat.svg" 
} = {}) {
    const skd = {};
    skd.elm = document.createElement("div");
    skd.elm.className = "knob";
    skd.elm.style.position = "absolute";
    skd.elm.style.left = left + "px";
    skd.elm.style.top = top + "px";
    skd.elm.style.width = width + "px";
    skd.elm.style.height = height + "px";
    skd.elm.style.backgroundSize = "cover";
    skd.elm.style.backgroundImage = `url(''${resolvePath(image)}'')`;
    skd.elm.style.backgroundRepeat = "no-repeat";

    // make knob rotatable AND bind it to parameter lifecycle
    skd.update = makeRotatable({
        element: skd.elm,
        initialValue: parameter.initialValue,
        min: parameter.min,
        max: parameter.max,
        maxRotation: 140,
        controlled: true,
        onBeginEdit: parameter.onBeginEdit,
        onEdit: parameter.onEdit,
        onEndEdit: parameter.onEndEdit,
    });

    return skd;
}


export  function createKnobSetup(paramName, knobId) {
    return (parameters) => setupAndSubscribe(
        parameters[paramName], 
        (parameter) => setupKnob(knobId, parameter)
    );
}


export function createBackground(cfg) {
    const bg = document.createElement("div");

    // size with fallback
    bg.style.width = (cfg.width ?? 300) + "px";
    bg.style.height = (cfg.height ?? 500) + "px";

    // background image if provided
    bg.style.backgroundImage = cfg.image ? `url(''${resolvePath(cfg.image)}'')` : "";
    bg.style.backgroundSize = "cover";
    bg.style.backgroundRepeat = "no-repeat";

    // absolute positioning in container
    bg.style.position = "absolute";
    bg.style.top = "0";
    bg.style.left = "0";
    bg.style.zIndex = "0"; // ensure it''s behind knobs

    return bg;
}';
		close
]
