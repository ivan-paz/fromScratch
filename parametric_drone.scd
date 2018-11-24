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
s.boot
Ndef(\x).playN([0,1])
Ndef(\x1).playN([0,1])
s.window.front

Ndef(\x).set(\freq, 60,\freq1, 120, \amp, 0.1, \mix, 0.01, \room, 0.001, \damp, 0.40);
Ndef(\x1).set(\freq, 121,\freq1, 60*(4/3), \amp,0.1, \mix, 0.5, \room, 0.020, \damp, 0.20)
// to explore the space
Ndef(\x).edit
Ndef(\x1).edit
//save combinations
~data = [[],[],[]]
(
~save = {|class|
	var values;
	values = Ndef(\x).getKeysValues;
	values = values.add(['class',class]);
	~data[class] = ~data[class].add(values);
})
~save.value(0)
//write csv data  -----------------------------------------------------------------------
(var location = "/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/";
var filename = "data";
f = File(location ++ filename ++ ".csv","w");
~data.writeArchive(location ++ filename);
~data.do{arg x, i;
	f.write(i + "," + x + "\n");
};
f.close)
//  play a combination by its class   ---------------------------------------------------
(
~playCombination = {|class|
	var combination;
	var size;
	combination = ~data[class].choose.postln;
	size = combination.size - 1;
	size.do{ arg i;
		var parameter;
		parameter = combination[i];
	        parameter[1];
	        Ndef(\x).set(parameter[0],parameter[1])
}}
)
~playCombination.value(0)
































//an old version to explore the space
(
w = Window().front;
w.addFlowLayout;
g = NdefParamGui(Ndef(\x), 15, w);
NdefParamGui(Ndef(\x1), 15, w);
)
