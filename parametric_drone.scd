//
s.boot

("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/ndefs.scd").load;
("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/lib.scd").load;
~before = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/before.scd").load;
~the = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/the.scd").load;
~rain = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/rain.scd").load;



Ndef(\x).playN([0,1])
Ndef(\x1).playN([0,1])

~read.value(~rain)

(Tdef(\ppplay,{
	inf.do{
		~set.value(Ndef(\x),  ~before, 0);
		[7,0.1,11,].choose.wait;
	}
}).play)

(Tdef(\dos,{
	inf.do{~set.value(Ndef(\x1), ~before, 0);
	[7,0.2,11].choose.wait;
}
}).stop
)









