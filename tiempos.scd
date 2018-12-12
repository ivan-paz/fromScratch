s.makeWindow
s.boot
//------------------------------------------------------------------------------
(SynthDef(\primero,{
	arg freq= 60, freq1=67, freq2=64,  out = 0;
	var sig, sig1, sig2;
	sig =  Saw.ar([freq.midicps - XLine.kr(0.0001,0.3,300), freq.midicps + 1], 0.2)*EnvGen.kr(Env.new([0,0.1,0.2,0.1,0],[60, 60, 120,60]));
	sig1 = Pulse.ar(freq1.midicps - XLine.kr(0.0001,1,300), 0.2,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0],[60, 120, 120] ));
	sig2 = Saw.ar([freq2.midicps, freq2.midicps + 1.1], 0.2) * EnvGen.kr(Env.new([0,0.2,0],             [150,150]));
	sig = sig + sig1 + sig2;
	sig = sig!2;
	Compander.ar(sig);
	sig = LPF.ar(sig;, 2000);
	sig = HPF.ar(sig,100);
	Out.ar(out, sig * 4)
}).add;
SynthDef(\segundo,{
	arg freq= 60, freq1= 67, freq2=64,  out = 0;
	var sig, sig1, sig2;
	sig =  Saw.ar(freq.midicps, 0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0.1, 0], [120, 60, 60,60]));
	sig1 = Pulse.ar([freq1.midicps + freq1.midicps + 1], 0.2,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0],[120, 120, 60] ));
	sig2 = Saw.ar([freq2.midicps, freq2.midicps - 1] ,0.2) * EnvGen.kr(Env.new([0,0.2,0],             [150,150]));
	sig = sig + sig1 + sig2;
	sig = sig!2;
	sig = Resonz.ar(sig, 261.62);
	Out.ar(out, sig * 4)
}).add)

//     Ndefs -----------------------------------
(Ndef(\x0,{
	arg freq1=60, freq2=67, amp=0.2;
	var sig;
	sig = Saw.ar([freq1.midicps,freq1.midicps - 1]) + Saw.ar([freq2.midicps,freq2.midicps + 1]);
	sig = FreeVerb.ar(sig * amp, SinOsc.kr(0.01), SinOsc.kr(0.02) );
});
Ndef(\x1,{
	arg freq1 = 48, freq2 = 55, amp=0.2;
	var sig;
	sig = Saw.ar([freq1.midicps,freq1.midicps - 1]) + Saw.ar([freq2.midicps,freq2.midicps + 1]);
	sig = FreeVerb.ar(sig * amp, SinOsc.kr(0.01), SinOsc.kr(0.02) );
}))
Ndef(\x0).playN([0,1]);
Ndef(\x1).playN([0,1]);
Ndef(\x0).set(\amp, 0.05)
Ndef(\x0).set(\freq1, 48)
Ndef(\x0).stop;
Ndef(\x1).stop;
Synth(\primero);
Synth(\segundo);


//sum([210,210,360])/60 = 13
(SynthDef(\tercero,{
	arg freq=60, freq1=67, freq2=64,  out = 0;
	var sig, sig1, sig2;
	sig = Saw.ar(freq.midicps, 0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0.15, 0.1, 0],  [180, 120, 120, 180, 180]));
	sig1 = Pulse.ar(freq1.midicps,0.2,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.15, 0.2, 0],[180, 180, 180, 240] ));
	sig2 = Saw.ar(freq2.midicps,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.17, 0],             [210,210,360]));
	sig = sig + sig1 + sig2;
	sig = sig!2;
	Out.ar( out, sig * 1.5 )
}).add;)
Synth(\tercero)

//--------------------------------------------------------------------------------
//Ndefs

(
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
	arg freq=60, freq1=67, freq2=64,  out = 2;
	var sig, sig1, sig2;
	sig =  Saw.ar(freq.midicps, 0.2) * EnvGen.kr(Env.new([0, 0.1, 0, 0.1, 0], [15, 5, 4, 15]));
	sig1 = Pulse.ar(freq1.midicps,0.2,0.2) * EnvGen.kr(Env.new([0, 0.1, 0.2, 0], [5, 10, 15] ));
	sig2 = Saw.ar(freq2.midicps,0.2) * EnvGen.kr(Env.new([0,0.1,0], [20,15]));
	sig = sig + sig1 + sig2;
	Out.ar(  out  ,sig)
}).add;
SynthDef(\hi,{
	arg amp,   out = 4;
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
}))
//Tdef(\playkick).play
//----------------------------------------------------------------------------------
//     start Ndefs
(
Ndef(\x3).playN([0]);
Ndef(\x4).playN([1]);
Ndef(\x5).playN([0]);
Ndef(\x6).playN([1]);
Ndef(\x3).set(\amp,0);
Ndef(\x4).set(\amp,0);
Ndef(\x5).set(\amp,0);
Ndef(\x6).set(\amp,0);
);
//-------------------------------------------------------------------
s.boot
~intro = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/intro.scd").load
~intro.keysValuesDo{|key| 'key : '.post;key.postln}
~intro.at(1)
(
~set = { |instrument, class, d|
	var rule;
	var combination;
	var keys;
        class.at(d);
	if(class.at(d)!=nil){
	rule = class.at(d).choose.postln;
	(rule.size -1).do{arg parameter;
		var value;
		value = rule[parameter].choose;
		combination = combination.add(value);
	}};
	combination.postln;
	
	keys = instrument.getKeysValues;
	keys.collect{ |x,i|
		//x.postln;
		//i.postln;
		'combination'.post;combination[i].postln;
		instrument.set(x[0],combination[i])
	};
	instrument.getKeysValues.postln;
}
)
~set.value( Ndef(\x3), ~intro, 7)
Ndef(\x3).set(\amp,0.5)
Ndef(\x3).play([0,1])











//    task

(
t = Task({

	1.do{
		Ndef(\x3).set(\freq, 200, \freq2, 159, \amp, 0.2);
		Ndef(\x4).set(\freq, 161, \with, 0.4, \freq1, 160, \width, 0.5, \amp, 0.27);

		Ndef(\x5).set(\freq, 200, \freq2, 159, \amp, 0.01);
		Ndef(\x6).set(\freq, 161, \with, 0.4, \freq1, 160, \width, 0.5, \amp, 0.01);
		[30,25].choose.wait;
		30.do{"parte a parte A Parte a".scramble.postln}
	};

	2.do{
		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.01);
		[10,7,15].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.26);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.36);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.01);
		[10,7,15].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.001);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.001);
		[10,7,15].choose.wait;
		30.do{"parte 2".scramble.post;"parte 2".postln};
	};

	1.do{
		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.01);
		[5,10,15].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.26);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.36);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.01);
		[5,10,15].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.001);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.001);
		[5,10,15].choose.wait;
	};

	1.do{
		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.01);
		[1,5,7].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.26);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.36);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.01);
		[1,5,7].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.001);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.001);
		[1,5,7].choose.wait;
	};
	1.do{
		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.01);
		[1,2,3].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.26);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.36);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.01);
		[1,2,3].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.001);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.001);
		[1,2,3].choose.wait;
	};
	2.do{
		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.01);
		[1,1.5].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.26);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.36);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.01);
		[1,1.5].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.001);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.001);
		[1,1.5].choose.wait;
	};
//---------------------------------------------------------------------------
	3.do{
		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.5, \amp, 0.01);
		[5,10,15].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.26);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.36);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.01);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 160, \width1, 0.4, \amp, 0.01);
		[5,10,15].choose.wait;

		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.23);
		Ndef(\x4).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.3);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.001);
		Ndef(\x6).set(\freq, 150, \width, 0.3, \freq1, 161, \width1, 0.5, \amp, 0.001);
		[5,10,15].choose.wait;
		20.do{"marca 3 MARCA3 marca 3 MARCA3".scramble.postln}
	};
	10.do{"lalalalalalalalalalalalalalalalalalalalalalalala".scramble.postln};
	4.do{
		10.do{"bombo".scramble.post};
		 Tdef(\playkick).play;
			~kickArray = [0];
			Ndef(\x3).set(\freq, 20, \freq2, 150, \amp, 0.30);
			Ndef(\x4).set(\freq, 101, \width, 0.3, \freq1, 102, \width1, 0.5, \amp, 0.40);//_______subele
			Ndef(\x5).set(\freq, 20, \freq2, 150, \amp, 0.01);
			Ndef(\x6).set(\freq, 101, \width, 0.3, \freq1, 102, \width1, 0.5, \amp, 0.03);
			[1,2,3].choose.wait;

			Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.35);
			Ndef(\x4).set(\freq, 150, \width, 0.6, \freq1, 160, \width1, 0.4, \amp, 0.45);//----------subele
			Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.02);
			Ndef(\x6).set(\freq, 150, \width, 0.6, \freq1, 160, \width1, 0.4, \amp, 0.02);
			[1,2,3].choose.wait;

			~kickArray = [0.9,0,0,0,   0,0,0,0,   0.9,0,0,0,   0,0,0,0];
			Ndef(\x3).set(\freq, 100, \freq2, 100, \amp, 0.29);
			Ndef(\x4).set(\freq, 100, \width, 0.6, \freq1, 102, \width1, 0.4, \amp, 0.35);
			Ndef(\x5).set(\freq, 100, \freq2, 100, \amp, 0.35);
			Ndef(\x6).set(\freq, 100, \width, 0.6, \freq1, 102, \width1, 0.4, \amp, 0.3);
	    	[3,2,5].choose.wait;   //<------- [3,2,5]
			~kickArray = [0]
	};

	3.do{
			Tdef(\playkick).play;
			~kickArray = [0];
			Ndef(\x3).set(\freq, 20, \freq2, 150, \amp, 0.33);
			Ndef(\x4).set(\freq, 101, \width, 0.3, \freq1, 102, \width1, 0.5, \amp, 0.47);

			Ndef(\x5).set(\freq, 20, \freq2, 150, \amp, 0.26);
			Ndef(\x6).set(\freq, 101, \width, 0.3, \freq1, 102, \width1, 0.5, \amp, 0.35);
			[1,2,3].choose.wait;

			Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.35);
			Ndef(\x4).set(\freq, 150, \width, 0.6, \freq1, 160, \width1, 0.4, \amp, 0.4);
			Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.3);
			Ndef(\x6).set(\freq, 150, \width, 0.6, \freq1, 160, \width1, 0.4, \amp, 0.4);
			[1,2,3].choose.wait;

			~kickArray = [0.9,0,0,0,   0,0,0,0,   0.9,0,0,0,   0,0,0,0];
		    Ndef(\x3).set(\freq, 100, \freq2, 100, \amp, 0.3);
			Ndef(\x4).set(\freq, 100, \width, 0.6, \freq1, 102, \width1, 0.4, \amp, 0.36);
			Ndef(\x5).set(\freq, 100, \freq2, 100, \amp, 0.37);
			Ndef(\x6).set(\freq, 100, \width, 0.6, \freq1, 102, \width1, 0.4, \amp, 0.35);
			[2,3,5].choose.wait;   //<------- [3,2,5]
			~kickArray = [0];
		'tres veces'.postln
	};

	3.do{

		Ndef(\x3).set(\freq, 20, \freq2, 150, \amp, 0.3);
		Ndef(\x4).set(\freq, 101, \width, 0.3, \freq1, 102, \width1, 0.5, \amp, 0.47);

		Ndef(\x5).set(\freq, 20, \freq2, 150, \amp, 0.27);
		Ndef(\x6).set(\freq, 101, \width, 0.3, \freq1, 102, \width1, 0.5, \amp, 0.35);
		[1,2,3].choose.wait;
		Ndef(\x3).set(\freq, 200, \freq2, 150, \amp, 0.35);
		Ndef(\x4).set(\freq, 150, \width, 0.6, \freq1, 160, \width1, 0.4, \amp, 0.41);
		Ndef(\x5).set(\freq, 200, \freq2, 150, \amp, 0.33);
		Ndef(\x6).set(\freq, 150, \width, 0.6, \freq1, 160, \width1, 0.4, \amp, 0.41);
		[1,2,3].choose.wait;

		~kickArray = [0.9,0,0,0,   0,0,0,0,   0.9,0,0,0,   0,0,0,0];
		Ndef(\x3).set(\freq, 100, \freq2, 100, \amp, 0.31);
		Ndef(\x4).set(\freq, 100, \width, 0.6, \freq1, 102, \width1, 0.4, \amp, 0.36);
		Ndef(\x5).set(\freq, 100, \freq2, 100, \amp, 0.35);
		Ndef(\x6).set(\freq, 100, \width, 0.6, \freq1, 102, \width1, 0.4, \amp, 0.36);
		[2,3,5].choose.wait; //<------- [3,2,5]
		~kickArray = [0];
		'tres veces'.postln //--------------------------------------------------------------------
	};

	5.do{
		Ndef(\x5).stop;
		Ndef(\x6).stop;
		Tdef(\playkick).stop;
		Ndef(\x3).set(\freq, 100, \freq2, 100, \amp, 0.37);  //subele
		Ndef(\x4).set(\freq, 100, \width, 0.6, \freq1, 102, \width1, 0.4, \amp, 0.38);
		[1,2,3].choose.wait;

		Tdef(\playhi).play;
		Ndef(\x3).set(\freq, 440, \freq2, 880, \amp, 0.27);
		Ndef(\x4).set(\freq, 660, \width, 0.3, \freq1, 661, \width1, 0.5, \amp, 0.3);
		[1,2,3].choose.wait;
		Tdef(\playhi).stop;
		"playing hi".postln
	};

	1.do{
		Ndef(\x3).set(\freq, 440, \freq2, 880, \amp, 0.32);
		Ndef(\x4).set(\freq, 660, \width, 0.3, \freq1, 661, \width1, 0.5, \amp, 0.3);
		[10,5,10].choose.wait;

		Synth(\sinusoidals);


		Ndef(\x3).set(\freq, 440, \freq2, 660, \amp, 0.29);
		Ndef(\x4).set(\freq, 441, \width, 0.3, \freq1, 661, \width1, 0.4, \amp, 0.29);
		[10,5,10].choose.wait;

		Ndef(\x3).set(\freq, 220, \freq2, 440, \amp, 0.3);
		Ndef(\x4).set(\freq, 660, \width, 0.3, \freq1, 221, \width1, 0.5, \amp, 0.26);
		[10,5,8].choose.wait;

		Ndef(\x3).set(\freq, 110, \freq2, 240, \amp, 0.3);
		Ndef(\x4).set(\freq, 660, \width, 0.3, \freq1, 221, \width1, 0.5, \amp, 0.25);
		[10,5,8].choose.wait;

		Ndef(\x3).set(\freq, 110, \freq2, 240, \amp, 0.29);
		Ndef(\x4).set(\freq, 330, \width, 0.3, \freq1, 221, \width1, 0.5, \amp, 0.26);
		[10,5,8].choose.wait;

		Ndef(\x3).set(\freq, 110, \freq2, 240, \amp, 0.29);
		Ndef(\x4).set(\freq, 330/2, \width, 0.3, \freq1, 221, \width1, 0.5, \amp, 0.26);
		[10,5,8].choose.wait;


		Synth(\sinusoidals);


		Ndef(\x3).set(\freq, 110, \freq2, 240, \amp, 0.23);
		Ndef(\x4).set(\freq, 330/4, \width, 0.3, \freq1, 221/2, \width1, 0.5, \amp, 0.25);
		[10,5,8].choose.wait;

		Synth(\sinusoidals).set(\freq,59,\freq1,64,\freq2,67);

		Ndef(\x3).set(\freq, 110/2, \freq2, 240/2, \amp, 0.2);
		Ndef(\x4).set(\freq, 330/4, \width, 0.3, \freq1, 221/2, \width1, 0.5, \amp, 0.23);
		[10,5,8].choose.wait;
	};
	'go for teud!!!'.postln
})
);
Ndef(\x3).stop;
Ndef(\x4).stop

t.start;
t.pause;
t.resume;
t.stop;
s.meter
