//
s.makeWindow;

("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/ndefs.scd").load;
("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/lib.scd").load;
~before = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/before.scd").load;
~the = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/the.scd").load;
~rain = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/rain.scd").load;


Ndef(\x).playN([0,1])
Ndef(\x1).playN([0,1])

~read.value(~before)
~read.value(~the)
~read.value(~rain)




(Tdef(\uno,{
	inf.do{
		~set.value(Ndef(\x), ~the,  0);
		[3,0.5,1].choose.wait;
		~set.value(Ndef(\x1), ~the,  0);
		[7,3,1].choose.wait
	}
}).stop)



Ndef(\x1).set(\amp,0.0)








