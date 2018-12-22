//Ndefs
(
Ndef(\x,{
	arg freq, freq1, amp, mix, room, damp;
	var sig;
	sig = Saw.ar([freq, freq + 1, freq1, freq1 -1],amp);
	sig = FreeVerb.ar(sig, SinOsc.kr(mix), SinOsc.kr(room), SinOsc.kr(damp));
});
Ndef(\x1,{
	arg freq, freq1, amp, mix, room, damp;
	var sig;
	sig = Saw.ar([freq, freq + 1, freq1, freq1 - 1],amp) * LFNoise0.ar(5);
	sig = FreeVerb.ar(sig, SinOsc.kr(mix), SinOsc.kr(room), SinOsc.kr(damp));
});

Ndef(\x2,{
	arg freqx3, freq2x3, ampx3, freqx4, widthx4, freq1x4, width1x4, ampx4, freqx5, freq2x5, ampx5, freqx6, widthx6, freq1x6, width1x6, ampx6;
	var sigx3, sigx4, sigx5, sigx6;

	sigx3 = Mix(Saw.ar([freqx3, freqx3 - 1], ampx3) + Saw.ar([freq2x3, freq2x3 - 1], ampx3)) + Impulse.ar(20, ampx3/4);
	sigx3 = FreeVerb.ar(sigx3, 0.33, 0.5, 0.5, 1) * 3 * ampx3;

	sigx4 = (Pulse.ar(freqx4, widthx4, ampx4) + Pulse.ar(freq1x4, width1x4, ampx4) );
	sigx4 = FreeVerb.ar(sigx4, 0.33, 0.5, 0.5, 1 ) * 3 * ampx4;

	sigx5 = Mix(Saw.ar([freqx5, freqx5 - 1], ampx5) + Saw.ar([freq2x5, freq2x5 - 1], ampx5)) + Impulse.ar(20, ampx5/4);
	sigx5 = FreeVerb.ar(sigx5, 0.33, 0.5, 0.5, 1) * 3 * ampx5;

	sigx6 = (Pulse.ar(freqx6, widthx6, ampx6) + Pulse.ar(freq1x6, width1x6, ampx6) );
	sigx6 = FreeVerb.ar(sigx6, 0.33, 0.5, 0.5, 1 ) * 3 * ampx6;
	
	sigx3 + sigx4 + sigx5 + sigx6
});
Ndef(\x3,{
	arg freq, freq2, amp;
	var sig;
	sig = Mix(Saw.ar([freq, freq - 1], amp) + Saw.ar([freq2, freq2 - 1], amp)) + Impulse.ar(20, amp/4);
	sig = FreeVerb.ar(sig, 0.33, 0.5, 0.5, 1) * 3 * amp;
});
Ndef(\x4,{
	arg freq, freq1, width, width1, amp;
	var sig;
	sig = (Pulse.ar(freq, width, amp) + Pulse.ar(freq1, width1, amp) );
	sig = FreeVerb.ar(sig, 0.33, 0.5, 0.5, 1 ) * 3 * amp
});
Ndef(\x5,{
	arg freq, freq2, amp;
	var sig;
	sig = Mix(Saw.ar([freq, freq - 1], amp) + Saw.ar([freq2, freq2 - 1], amp)) + Impulse.ar(20, amp/4);
	sig = FreeVerb.ar(sig, 0.33, 0.5, 0.5, 1) * 3 * amp;
});
Ndef(\x6,{
	arg freq, freq1, width, width1, amp;
	var sig;
	sig = (Pulse.ar(freq, width, amp) + Pulse.ar(freq1, width1, amp) );
	sig = FreeVerb.ar(sig, 0.33, 0.5, 0.5, 1 ) * 3 * amp
});
SynthDef(\sinusoidals,{
	arg freq=60, freq1=67, freq2=64,  out = 0;
	var sig, sig1, sig2;
	sig =  Saw.ar(freq.midicps, 0.2) * EnvGen.kr(Env.new([0, 0.1, 0, 0.1, 0], [15, 5, 4, 15]));
	sig1 = Pulse.ar(freq1.midicps,0.2,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0], [5, 10, 15] ));
	sig2 = Saw.ar(freq2.midicps,0.2) * EnvGen.kr(Env.new([0,0.1,0], [20,15]));
	sig = sig + sig1 + sig2;
	Out.ar(  out  ,sig)
}).add;
SynthDef(\hi,{
	arg amp,   out = 1;
	var sig, env;
	sig = WhiteNoise.ar(amp);
	env =  EnvGen.kr(Env.perc(0.01, 0.01),1,doneAction:2);
	Out.ar( out ,Pan2.ar(sig*env,FSinOsc.kr(2), 0.5));
}).add;
Tdef(\playhi,{
	inf.do{
		Synth(\hi).set(\amp, 0.1);
		(3.75/32).wait
	}
});
~kickArray = [0];
Tdef(\playkick,{
	var cont = -1;
	inf.do{
		cont = cont + 1;
		Synth(\SOSkick).set(\amp,~kickArray[cont%~kickArray.size]);
		(60/(~bpm*4)).wait
	}
})

)

