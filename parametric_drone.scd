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

//save combinations
~parameterCombinations = []
(
~save = {|class|
	var values;
	values = Ndef(\x).getKeysValues;
	values = values.add(['class',class]);
	~parameterCombinations = ~parameterCombinations.add(values);
	~parameterCombinations.do{|x| x.postln}

})
~save.value(1)
//write csv data
(
var location = "/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/";
var filename = "parameterCombination";
f = File(location ++ filename ++ ".csv","w");
~parameterCombinations.writeArchive(location ++ filename);
~parameterCombinations.do{arg x, i;
	f.write(i + "," + x + "\n");
};
f.close
)




(
w = Window().front;
w.addFlowLayout;
g = NdefParamGui(Ndef(\x), 15, w);
NdefParamGui(Ndef(\x1), 15, w);
)
