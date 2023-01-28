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



Candle();
