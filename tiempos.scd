s.makeWindow
s.boot

("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/ndefs.scd").load
("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/lib.scd").load

(
~x3intro = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/x3intro.scd").load;
~intro = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/intro.scd").load;
~main = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/main.scd").load;
~break = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/break.scd").load;
~end = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/end.scd").load
)


~read.value(~intro)



Ndef(\x3).playN([0,1])
Ndef(\x2).play([0,1])

~set.value( Ndef(\x2), ~intro, 7)
~set.value( Ndef(\x3), ~x3intro, 0)


Ndef(\x2).getKeysValues.do{|key| key.postln}

~read.value(~end)

(Tdef(\y,{
	inf.do{
		~set.value(Ndef(\x2), ~break, 4);
		~set.value(Ndef(\x3), ~break, 4);
	[7,3,11].choose.wait}
}).play)


Synth(\sinusoidals)
Synth(\sinusoidals).set(\freq,59,\freq1,64,\f6req2,67);
Tdef(\playhi).stop

Ndef(\x2).stop;
Ndef(\x3).stop;



