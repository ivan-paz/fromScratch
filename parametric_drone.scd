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

Ndef(\x).set( \freq, 120,\freq1, 180,      \amp, 0.1, \mix, 0.01, \room, 0.001, \damp, 0.40);
Ndef(\x1).set(\freq, 121,\freq1, 60*(4/3), \amp, 0.1, \mix, 0.5,  \room, 0.020, \damp, 0.20)


Ndef(\x).set( \freq, 60, \freq1, 120,      \amp, 0.1, \mix, 0.01, \room, 0.001, \damp, 0.40);
Ndef(\x1).set(\freq, 121,\freq1, 60*(4/3), \amp,0.1, \mix, 0.5, \room, 0.020,   \damp, 0.20)

Ndef(\x).set( \freq, 80.48,\freq1, 80.86, \amp, 0.1, \mix, 0.06, \room, 0.02, \damp, 8);
Ndef(\x1).set(\freq, 360.45,\freq1, 662.02, \amp,0.1, \mix, 10, \room, 0.4, \damp, 4)

//To explore the space
Ndef(\x).edit
Ndef(\x1).edit


("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/lib.scd").load;
("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/rules.scd").load;

~before.do{arg x; x.postln}

~set = { |instrument, class, d|
	var selectedCombination = []
}

//select an existing seed OR create an empty place
//~data.value(seed) -> seedbyname  or ~data.value() = new[]
~seed = ~read.value('data')
~seed.do{|x| x.do{|y| y.do{|z| z.postln}}}

//   use RuLer on the imported seed

//save instrument parameters into
~save.value(Ndef(\x), 'B', ~seed);

~data.do{arg x; x.postln}


//
~set.value(Ndef(\x),'A',~data);


~hardSave.value(~data,name)
//display function arguments
~save.argNames






























//an old version to explore the space
(
w = Window().front;
w.addFlowLayout;
g = NdefParamGui(Ndef(\x), 15, w);
NdefParamGui(Ndef(\x1), 15, w);
)
