//save combinations
(
~save = {
	|instrument, class, data|
	var values;
	values = instrument.getKeysValues;
	values = values.add(['class',class]);
	if(data.indexOfEqual(values).isNil){data = data.add(values)};
	//data.do{arg x; x.postln}
});

//~save.value(Ndef(\x),'A',~data);

// set
(
~set = {
	|instrument class data|
	var combination;
	var size;
	while(
		{},
		{});
	combination = 
	size = combination.size - 1;
	size.do{ arg i;
		var parameter;
		parameter = combination[i];
	        parameter[1];
	        instrument.set(parameter[0],parameter[1])
}}
);
//~playCombination.value(instrument,class,data)

// hardSave 
//(var location = "/home/ivan/documents/livecoding/first_draft_livecoding_rio/fromScratch/";
//var filename = "data";
//f = File(location ++ filename ++ ".csv","w");
//~data.writeArchive(location ++ filename);
//~data.do{arg x, i;
//	f.write(i + "," + x + "\n");
//};
//f.close)
(
i = 0;
while ( { i < 5 }, { i = i + 1; "boing".postln });
)






























////an old version to explore the space
//(
//w = Window().front;
//w.addFlowLayout;
//g = NdefParamGui(Ndef(\x), 15, w);
//NdefParamGui(Ndef(\x1), 15, w);
//)
