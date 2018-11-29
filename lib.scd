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
