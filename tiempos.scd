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
(~read.value(~end);
~read.value(~x3end);
)
(
Tdef(\y,{
	inf.do{
		~set.value(Ndef(\x2),~end, 0);
		~set.value(Ndef(\x3),~x3end,0);
		[22,11].choose.wait
}}).stop)
)

Synth(\sinusoidals)
Tdef(\playhi).stop
Ndef(\x2).stop
Ndef(\x3).stop

