//
s.boot
(Ndef(\x,{
	arg freq, freq1, amp, mix, room, damp;
	var sig;
	sig = Saw.ar([freq, freq + 1, freq1, freq1 -1]);
	sig = FreeVerb.ar(sig, SinOsc.kr(mix), SinOsc.kr(room), SinOsc.kr(damp));
});
Ndef(\x1,{
	arg freq, freq1, amp, mix, room, damp;
	var sig;
	sig = Saw.ar([freq, freq + 1, freq1, freq1 - 1]) * LFNoise0.ar(5);
	sig = FreeVerb.ar(sig, SinOsc.kr(mix), SinOsc.kr(room), SinOsc.kr(damp));
}))
Ndef(\x).playN([0,1])
Ndef(\x1).playN([0,1])
s.window.front

Ndef(\x).set(\freq, 60,\freq1, 120, \amp, 0.1, \mix, 0.01, \room, 0.001, \damp, 0.40);
Ndef(\x1).set(\freq, 121,\freq1, 60*(4/3), \amp,0.1, \mix, 0.5, \room, 0.020, \damp, 0.20)

// to explore the space
Ndef(def(\x).edit
Ndef(\x1).edit

("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/lib").load;

~data = [];
~save.value();
~set.value(\instrument,class)

































//an old version to explore the space
(
w = Window().front;
w.addFlowLayout;
g = NdefParamGui(Ndef(\x), 15, w);
NdefParamGui(Ndef(\x1), 15, w);
)
