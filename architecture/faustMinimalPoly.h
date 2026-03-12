#include <cmath>
#include <cstring>

#include "faust/misc.h"
#include "faust/gui/UI.h"
#include "faust/gui/JSONUIDecoder.h"
#include "faust/dsp/dsp.h"
#include "faust/dsp/dsp-adapter.h"
#include "faust/gui/meta.h"

// BEGIN-FAUSTDSP

<<includeIntrinsic>>

<<includeclass>>

// END-FAUSTDSP

#include "faust/dsp/faust-poly-engine.h"
#include "faust/audio/dummy-audio.h"

std::list<GUI*> GUI::fGuiList;
ztimedmap GUI::gTimedZoneMap;

