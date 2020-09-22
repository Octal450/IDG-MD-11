# McDonnell Douglas MD-11 Property Tree Setup
# Copyright (c) 2020 Josh Davidson (Octal450)
# Nodes organized like property tree, except when lots of identical (example: Gear wow), where vectors are used to make it easier
# Anything that says Temp is set by another file to avoid multiple getValue calls
# Usage Example: pts.Class.SubClass.node.getValue()

var Controls = {
	Flight: {
		aileronDrivesTiller: props.globals.getNode("/controls/flight/aileron-drives-tiller"),
		autoCoordination: props.globals.getNode("/controls/flight/auto-coordination", 1),
		dialAFlap: props.globals.getNode("/controls/flight/dial-a-flap"),
		elevatorTrim: props.globals.getNode("/controls/flight/elevator-trim"),
		flaps: props.globals.getNode("/controls/flight/flaps"),
		flapsTemp: 0,
		flapsInput: props.globals.getNode("/controls/flight/flaps-input"),
		speedbrake: props.globals.getNode("/controls/flight/speedbrake"),
		speedbrakeArm: props.globals.getNode("/controls/flight/speedbrake-arm"),
		speedbrakeTemp: 0,
		wingflexEnable: props.globals.getNode("/controls/flight/wingflex-enable"),
	},
	Gear: {
		brakeParking: props.globals.getNode("/controls/gear/brake-parking"),
		brakeLeft: props.globals.getNode("/controls/gear/brake-left"),
		brakeRight: props.globals.getNode("/controls/gear/brake-right"),
		gearDown: props.globals.getNode("/controls/gear/gear-down"),
	},
	Lighting: {
		beacon: props.globals.getNode("/controls/lighting/beacon"),
		landingLightL: props.globals.getNode("/controls/lighting/landing-light-l"),
		landingLightN: props.globals.getNode("/controls/lighting/landing-light-n"),
		landingLightR: props.globals.getNode("/controls/lighting/landing-light-r"),
		logoLights: props.globals.getNode("/controls/lighting/logo-lights"),
		navLights: props.globals.getNode("/controls/lighting/nav-lights"),
		strobe: props.globals.getNode("/controls/lighting/strobe"),
	},
	Switches: {
		adgHandle: props.globals.getNode("/controls/switches/adg-handle"),
		minimums: props.globals.getNode("/controls/switches/minimums"),
		noSmokingSign: props.globals.getNode("/controls/switches/no-smoking-sign"),
		seatbeltSign: props.globals.getNode("/controls/switches/seatbelt-sign"),
	},
};

var Fdm = {
	JSBsim: {
		Fadec: {
			throttleLever: [props.globals.getNode("/fdm/jsbsim/fadec/throttle-lever[0]"), props.globals.getNode("/fdm/jsbsim/fadec/throttle-lever[1]"), props.globals.getNode("/fdm/jsbsim/fadec/throttle-lever[2]")],
		},
		Position: {
			wow: props.globals.getNode("/fdm/jsbsim/position/wow"),
			wowTemp: 0,
		},
		Propulsion: {
			setRunning: props.globals.getNode("/fdm/jsbsim/propulsion/set-running"),
			tatC: props.globals.getNode("/fdm/jsbsim/propulsion/tat-c"),
		},
	},
};

var Gear = {
	rollspeedMs: [props.globals.getNode("/gear/gear[0]/rollspeed-ms"), props.globals.getNode("/gear/gear[1]/rollspeed-ms"), props.globals.getNode("/gear/gear[2]/rollspeed-ms"), props.globals.getNode("/gear/gear[3]/rollspeed-ms")],
	wow: [props.globals.getNode("/gear/gear[0]/wow"), props.globals.getNode("/gear/gear[1]/wow"), props.globals.getNode("/gear/gear[2]/wow"), props.globals.getNode("/gear/gear[3]/wow")],
};

var Instrumentation = {
	AirspeedIndicator: {
		indicatedMach: props.globals.getNode("/instrumentation/airspeed-indicator/indicated-mach"),
		indicatedSpeedKt: props.globals.getNode("/instrumentation/airspeed-indicator/indicated-speed-kt"),
	},
	Altimeter: {
		oldQnh: props.globals.getNode("/instrumentation/altimeter/oldqnh"),
		settingInhg: props.globals.getNode("/instrumentation/altimeter/setting-inhg"),
		std: props.globals.getNode("/instrumentation/altimeter/std"),
	},
	Efis: {
		hdgTrkSelected: [props.globals.initNode("/instrumentation/efis[0]/hdg-trk-selected", 0, "BOOL"), props.globals.initNode("/instrumentation/efis[1]/hdg-trk-selected", 0, "BOOL")],
		Inputs: {
			arpt: [props.globals.initNode("/instrumentation/efis[0]/inputs/arpt", 0, "BOOL"), props.globals.initNode("/instrumentation/efis[1]/inputs/arpt", 0, "BOOL")],
			data: [props.globals.initNode("/instrumentation/efis[0]/inputs/data", 0, "BOOL"), props.globals.initNode("/instrumentation/efis[1]/inputs/data", 0, "BOOL")],
			lhVorAdf: [props.globals.initNode("/instrumentation/efis[0]/inputs/lh-vor-adf", 0, "INT"), props.globals.initNode("/instrumentation/efis[1]/inputs/lh-vor-adf", 0, "INT")],
			ndCentered: [props.globals.initNode("/instrumentation/efis[0]/inputs/nd-centered", 0, "BOOL"), props.globals.initNode("/instrumentation/efis[1]/inputs/nd-centered", 0, "BOOL")],
			rangeNm: [props.globals.initNode("/instrumentation/efis[0]/inputs/range-nm", 10, "INT"), props.globals.initNode("/instrumentation/efis[1]/inputs/range-nm", 10, "INT")],
			rhVorAdf: [props.globals.initNode("/instrumentation/efis[0]/inputs/rh-vor-adf", 0, "INT"), props.globals.initNode("/instrumentation/efis[1]/inputs/rh-vor-adf", 0, "INT")],
			sta: [props.globals.initNode("/instrumentation/efis[0]/inputs/sta", 0, "BOOL"), props.globals.initNode("/instrumentation/efis[1]/inputs/sta", 0, "BOOL")],
			tfc: [props.globals.initNode("/instrumentation/efis[0]/inputs/tfc", 0, "BOOL"), props.globals.initNode("/instrumentation/efis[1]/inputs/tfc", 0, "BOOL")],
			wpt: [props.globals.initNode("/instrumentation/efis[0]/inputs/wpt", 0, "BOOL"), props.globals.initNode("/instrumentation/efis[1]/inputs/wpt", 0, "BOOL")],
		},
		Mfd: {
			displayMode: [props.globals.initNode("/instrumentation/efis[0]/mfd/display-mode", "MAP", "STRING"), props.globals.initNode("/instrumentation/efis[1]/mfd/display-mode", "MAP", "STRING")],
		},
	},
};

var Orientation = {
	headingDeg: props.globals.getNode("/orientation/heading-deg"),
	headingMagneticDeg: props.globals.getNode("/orientation/heading-magnetic-deg"),
};

var Sim = {
	CurrentView: {
		fieldOfView: props.globals.getNode("/sim/current-view/field-of-view", 1),
		headingOffsetDeg: props.globals.getNode("/sim/current-view/heading-offset-deg", 1),
		name: props.globals.getNode("/sim/current-view/name", 1),
		type: props.globals.getNode("/sim/current-view/type", 1),
		viewNumber: props.globals.getNode("/sim/current-view/view-number", 1),
		zOffsetDefault: props.globals.getNode("/sim/current-view/z-offset-default", 1),
		zOffsetM: props.globals.getNode("/sim/current-view/z-offset-m", 1),
		zOffsetMaxM: props.globals.getNode("/sim/current-view/z-offset-max-m", 1),
		zOffsetMinM: props.globals.getNode("/sim/current-view/z-offset-min-m", 1),
	},
	Rendering: {
		Headshake: {
			enabled: props.globals.getNode("/sim/rendering/headshake/enabled"),
		},
	},
	Replay: {
		replayState: props.globals.getNode("/sim/replay/replay-state"),
		wasActive: props.globals.initNode("/sim/replay/was-active", 0, "BOOL"),
	},
	Sound: {
		btn1: props.globals.initNode("/sim/sound/btn1", 0, "BOOL"),
		btn3: props.globals.initNode("/sim/sound/btn3", 0, "BOOL"),
		flapsClick: props.globals.initNode("/sim/sound/flaps-click", 0, "BOOL"),
		knb1: props.globals.initNode("/sim/sound/knb1", 0, "BOOL"),
		noSmokingSign: props.globals.initNode("/sim/sound/no-smoking-sign", 0, "BOOL"),
		noSmokingSignInhibit: props.globals.initNode("/sim/sound/no-smoking-sign-inhibit", 0, "BOOL"),
		ohBtn: props.globals.initNode("/sim/sound/oh-btn", 0, "BOOL"),
		seatbeltSign: props.globals.initNode("/sim/sound/seatbelt-sign", 0, "BOOL"),
		switch1: props.globals.initNode("/sim/sound/switch1", 0, "BOOL"),
	},
	Time: {
		deltaRealtimeSec: props.globals.getNode("/sim/time/delta-realtime-sec"),
		elapsedSec: props.globals.getNode("/sim/time/elapsed-sec"),
	},
	View: {
		Config: {
			defaultFieldOfViewDeg: props.globals.getNode("/sim/view/config/default-field-of-view-deg", 1),
		},
	},
};

var Systems = {
	Acconfig: {
		autoConfigRunning: props.globals.getNode("/systems/acconfig/autoconfig-running"),
		Options: {
			throttleOverride: props.globals.getNode("/systems/acconfig/options/throttle-override"),
		}
	},
	Shake: {
		effect: props.globals.getNode("/systems/shake/effect"),
		shaking: props.globals.initNode("/systems/shake/shaking", 0, "DOUBLE"),
	},
};

var Velocities = {
	groundspeedKt: props.globals.getNode("/velocities/groundspeed-kt"),
};

setprop("/systems/acconfig/property-tree-setup-loaded", 1);
