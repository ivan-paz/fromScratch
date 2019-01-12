//  \freq, 59,  \freq1,64,  \freq2, 67);
//  \playhi

("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/lib.scd").load;
("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/ndefs.scd").load;

(
~x3intro = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/x3intro.scd").load;
~x3main = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/x3main.scd").load;
~x3break = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/x3break.scd").load;
~x3end = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/x3end.scd").load;

~intro = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/intro.scd").load;
~main = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/main.scd").load;
~break = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/break.scd").load;
~end = ("/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/end.scd").load
)


Ndef(\x2).playN([0,1])
Ndef(\x3).playN([0,1])
(~read.value(~intro);
~read.value(~x3main);
)
(
Tdef(\y,{
	inf.do{
		~set.value(Ndef(\x2),~intro,7);
		~set.value(Ndef(\x3),~x3intro,0);
		[5,7,3].choose.wait
}}).play)
)

Synth(\sinusoidals)
Tdef(\playhi).stop
Ndef(\x2).set(\amp,0.1)
Ndef(\x2).stop

