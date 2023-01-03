
function scr_createPickup(typeNum){

	var pickup = instance_create_layer(x, y, "Pickups", obj_Pickup);
	
	with (pickup) {
		type = typeNum;
		image_index = type;
		sprite_index = spr_pickupSprite;
		mapx = x;
		mapy = y
		magnetized = false;
		moveSpeed = 5;
		image_speed = 0;
	}
	
	return pickup;

}