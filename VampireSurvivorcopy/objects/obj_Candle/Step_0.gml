

if (candleDeathTimer > 0) {
	candleDeathTimer--;
	if (candleDeathTimer == 0) {
		randomize();
		var randomnum = irandom_range(1, 100);
		var val = 0;
		for (var i = 0; i < ds_list_size(candleDropList); i++) {
			val += ds_list_find_value(candleDropList, i);

			if (val >= randomnum) break;
			
		}
		var pickup = scr_createPickup(i)
		instance_destroy();		
	}
}

if (place_meeting(x, y, obj_Projectile)) && (candleDeathTimer == -1) {
	candleDeathTimer = candleDeathTime;
}