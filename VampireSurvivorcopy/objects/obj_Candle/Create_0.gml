function Candle() {
	candleDeathTimer = -1;
	candleDeathTime = 15;
	//candleDeathTimer value is set to 60
	
	//Refer to Obsidian for how these drop chances work
	candleDropList = ds_list_create();
	ds_list_add(candleDropList, 0);
	ds_list_add(candleDropList, 10);
	ds_list_add(candleDropList, 2);
	ds_list_add(candleDropList, 46);
	ds_list_add(candleDropList, 18);
	ds_list_add(candleDropList, 16);
	ds_list_add(candleDropList, 2);
	ds_list_add(candleDropList, 2);
	ds_list_add(candleDropList, 2);
	ds_list_add(candleDropList, 2);
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
