function Candle() {
	candleDeathTimer = -1;
	candleDeathTime = 15;
	//candleDeathTimer value is set to 60
	
	//Refer to Obsidian for how these drop chances work
	candleDropList = ds_list_create();
	ds_list_add(candleDropList, 0); //1 exp
	ds_list_add(candleDropList, 10); //100 exp
	ds_list_add(candleDropList, 2); //1000 exp
	ds_list_add(candleDropList, 37); //1 money
	ds_list_add(candleDropList, 18); //10 money
	ds_list_add(candleDropList, 16); //chicken
	ds_list_add(candleDropList, 5); //magnet
	ds_list_add(candleDropList, 5); //screenwipe
	ds_list_add(candleDropList, 5); //chest
	

}

function candleDestroy() {
	randomize();
	var randomnum = irandom_range(1, 100);
	var val = 0;
	for (var i = 0; i < ds_list_size(candleDropList); i++) {
		val += ds_list_find_value(candleDropList, i);
		if (val >= randomnum) break;
			
	}
	var pickup = scr_createPickup(i);
	instance_destroy();
}

Candle();
