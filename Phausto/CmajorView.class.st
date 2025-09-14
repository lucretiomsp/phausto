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

{ #category : 'accessing - structure variables' }
CmajorView class >> emptyFadersConfig [

^ 'export const faderConfigs = []'
]

{ #category : 'accessing - structure variables' }
CmajorView class >> emptyKnobsConfig [

^ 'export const knobConfigs = []'
]

{ #category : 'adding' }
CmajorView >> addTo: aCmajorPatch [

	| patchFolder patchFilePath patchFileWithGUI |

	patchFolder := aCmajorPatch name.
	patchFilePath := patchFolder , '.cmajorPatch'.
	self folder: patchFolder.
	
	patchFileWithGUI := (aCmajorPatch folder / patchFilePath) contents addViewPropertyFrom: self .
	
   (CmajorPatch parentFolder  / patchFolder / patchFilePath) writeStream nextPutAll: patchFileWithGUI; close .
	aCmajorPatch createIndexJs.
	self uiConfigFileLocator delete.
	self
		writeViewHelperJS;
		writeBackgroundVariableToConfig;
		writeKnobsVariableToConfig;
		writeFadersVariableToConfig .
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
	faders := OrderedCollection new.
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
CmajorView >> writeEmptyFadersVariableToConfig [


	self uiConfigFileLocator writeStream setToEnd
		nextPutAll: self class emptyFadersConfig ;
		close
]

{ #category : 'writing' }
CmajorView >> writeEmptyKnobsVariableToConfig [


	self uiConfigFileLocator writeStream setToEnd
		nextPutAll: self class emptyKnobsConfig ;
		close
]

{ #category : 'writing' }
CmajorView >> writeFadersVariableToConfig [

self faders isEmpty ifTrue: [ self writeEmptyFadersVariableToConfig ] ifFalse: [ self writeFilledFadersVariableToConfig ]
]

{ #category : 'writing' }
CmajorView >> writeFilledFadersVariableToConfig [
"self uiConfigFileLocator writeStream setToEnd
		nextPutAll: 'export const faderConfigs = [ ];';
		close
"
	| fadersInsideArray  |
	fadersInsideArray := String new writeStream.
	self faders do: [ :i |
			fadersInsideArray 
				nextPutAll: i asJsObjectString;
				nextPutAll: ' , ';
				cr ].

	self uiConfigFileLocator writeStream setToEnd
		nextPutAll: 'export const faderConfigs = [ ';
		cr;
		nextPutAll: (fadersInsideArray contents allButLast: 2);
		nextPutAll: ' ];';
		close 
]

{ #category : 'writing' }
CmajorView >> writeFilledKnobsVariableToConfig [ 


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
CmajorView >> writeKnobsVariableToConfig [

self knobs isEmpty ifTrue: [ self writeEmptyKnobsVariableToConfig ] ifFalse: [ self writeFilledKnobsVariableToConfig ]
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


// #######################         BACKGROUND ###########################

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
}
    
// ###################### CREATE FADER ##########################

export function createFaderDiv(parameter, {
    left = "0px",
    top = "0px",
    width = "40px",
    height = "100px",
    image = "./faderbg.png",
    bgthumb = "./faderthumb.png",
    isHorizontal = false
} = {}) {
    const fader = {};
    fader.elm = document.createElement("div");
    fader.elm.style.position = "absolute";
    fader.elm.style.left = left;
    fader.elm.style.top = top;
    fader.elm.style.width = width;
    fader.elm.style.height = height;
    fader.elm.style.backgroundImage = `url(''${resolvePath(image)}'')`;
    fader.elm.style.backgroundSize = "cover";
    fader.elm.style.backgroundRepeat = "no-repeat";

    // create thumb
    const thumb = document.createElement("div");
    thumb.style.position = "absolute";
    thumb.style.width = isHorizontal ? "20px" : "100%"; // thumb size depends on orientation
    thumb.style.height = isHorizontal ? "100%" : "20px";
    thumb.style.backgroundImage = `url(''${resolvePath(bgthumb)}'')`;
    thumb.style.backgroundRepeat = "no-repeat";
    thumb.style.backgroundSize = "contain";
    thumb.style.cursor = "pointer";

    fader.elm.appendChild(thumb);

    // state
    const state = { value: parameter.initialValue ?? parameter.min };

    // scaling helpers
    const toPosition = (value) => {
        const min = parameter.min ?? 0;
        const max = parameter.max ?? 1;
        if (isHorizontal) {
            const range = parseInt(width) - parseInt(thumb.style.width);
            return ((value - min) / (max - min)) * range;
        } else {
            const range = parseInt(height) - parseInt(thumb.style.height);
            return range - ((value - min) / (max - min)) * range;
        }
    };

    const toValue = (pos) => {
        const min = parameter.min ?? 0;
        const max = parameter.max ?? 1;
        if (isHorizontal) {
            const range = parseInt(width) - parseInt(thumb.style.width);
            return min + (pos / range) * (max - min);
        } else {
            const range = parseInt(height) - parseInt(thumb.style.height);
            return min + (1 - (pos / range)) * (max - min);
        }
    };

    // update UI from value
    const update = (val, force) => {
        state.value = val;
        const pos = toPosition(val);
        if (isHorizontal) {
            thumb.style.left = pos + "px";
            thumb.style.top = "0px";
        } else {
            thumb.style.top = pos + "px";
            thumb.style.left = "0px";
        }
    };

    // gesture handling
    let startCoord, startVal;

    const onMouseMove = (e) => {
        e.preventDefault();
        const delta = isHorizontal ? (e.clientX - startCoord) : (e.clientY - startCoord);

        let pos = toPosition(startVal) + delta;
        if (isHorizontal) {
            const range = parseInt(width) - parseInt(thumb.style.width);
            pos = Math.min(Math.max(pos, 0), range);
        } else {
            const range = parseInt(height) - parseInt(thumb.style.height);
            pos = Math.min(Math.max(pos, 0), range);
        }

        const val = toValue(pos);
        parameter.onEdit?.(val);
        update(val, true);
    };

    const onMouseUp = () => {
        document.removeEventListener("mousemove", onMouseMove);
        document.removeEventListener("mouseup", onMouseUp);
        parameter.onEndEdit?.();
    };

    const onMouseDown = (e) => {
        startCoord = isHorizontal ? e.clientX : e.clientY;
        startVal = state.value;
        parameter.onBeginEdit?.();
        document.addEventListener("mousemove", onMouseMove);
        document.addEventListener("mouseup", onMouseUp);
    };

    thumb.addEventListener("mousedown", onMouseDown);

    // initial position
    update(state.value, true);

    // connect to backend updates
    parameter.subscribe(update);

    fader.update = update;
    return fader;
}


	';
		close
]
