
function Pickup(typeNum) {
	type = typeNum;
	image_index = type;
	sprite_index = spr_pickupsprite;
	mapx = x;
	mapy = y
	magnetized = false;
	moveSpeed = 30;
}


function moveTowardsPlayer() {
	//Run when in player's magnet range aka 
	
}

function checkIfInPlayerMagnetRange() {
	//point_distance < sqrt(sqr(spritelength) + sqr(spriteheight) + obj_player.magnetradius (formula I currnetly have for checking if in magnet range
	
}



Pickup(irandom_range(0, 9));