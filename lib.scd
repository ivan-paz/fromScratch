//    l   i   b   -  f u n c t i o n s
(~read = { |class|
	class.keysValuesDo{  |key| '  --->  '.post; key.postln }
});
(~set = { |instrument, class, d|
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
			//'combination'.post;combination[i].postln;
			instrument.set(x[0],combination[i])
	      	};
		instrument.getKeysValues.postln;
})

