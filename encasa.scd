~atractores = ("/home/ivan/documents/livecoding/presets/enCasa").load
~atractores.do{arg x; x.postln}
[0 - 5] [6 - 11] [12 - 17] [18 - 26]

(Ndef(\x7,{
	arg freq1=96, freq2=119, amp=0.3; // 0.8
	var sig;
	sig = Saw.ar([freq1,freq1-1]) + Saw.ar([freq2,freq2 + 1]);
	sig = sig *amp;
});
Ndef(\x8,{
	arg freq3=178, freq4=119, amp=0.3;
	var sig;
	sig = Saw.ar([freq3,freq3-1]) + Saw.ar([freq4,freq4 + 1]);
	sig = sig *amp;
});
Ndef(\x9,{
	arg freq5=268, freq6=268, amp=0.3;
	var sig;
	sig = Saw.ar([freq5,freq5-1]) + Saw.ar([freq6,freq6 + 1]);
	sig = sig *amp;
});
Ndef(\x10,{
	arg freq7=400, freq8=400, amp=0.3;
	var sig;
	sig = Saw.ar([freq7,freq7-1]) + Saw.ar([freq8,freq8 + 1]);
	sig = sig *amp;
}))
Ndef(\x7).set(\amp,0);
Ndef(\x8).stop
Ndef(\x9).playN([0,1])
Ndef(\x9).set(\amp,0)
Ndef(\x10).play([0,1])
Ndef(\x10).stop

(v = Tdef(\t,{
	100.do{
		Ndef(\x7).set(\freq1, ~atractores[rrand(0,5)][1],\freq2,119);
		Ndef(\x8).set(\freq3,178,\freq4, ~atractores[rrand(6,11)][2]);
		Ndef(\x9).set(\freq5, 268, \freq6, ~atractores[rrand(12,17)][2]);
		Ndef(\x10).set(\freq7, 400, \freq8, ~atractores[rrand(18,26)][2]);
		Ndef(\x7).getKeysValues.postln;
		[8,8,8,16].choose.wait;
};
	100.do{"100 times is a lot but every term is eventually met . . . ".scramble.postln}
}))

v.play
v.pause
v.stop



