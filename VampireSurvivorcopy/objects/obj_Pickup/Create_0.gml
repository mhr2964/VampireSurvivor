
function Pickup(typeNum) {
	type = typeNum;
	image_index = type;
	sprite_index = spr_pickupSprite;
	mapx = x;
	mapy = y
	magnetized = false;
	moveSpeed = 10;
	image_speed = 0;
	
}


function moveTowardsPlayer() {
	//Run when in player's magnet range aka
	var dirToPlayer = point_direction(x, y, obj_Player.x, obj_Player.y);
	//Ensure that pickup doesn't move too fast and miss player
	var currentDis = point_distance(x, y, obj_Player.x, obj_Player.y);
	if (currentDis < point_distance(x + lengthdir_x(moveSpeed, dirToPlayer), y + lengthdir_y(moveSpeed, dirToPlayer), obj_Player.x, obj_Player.y)) {
		x += lengthdir_x(currentDis, dirToPlayer);
		y += lengthdir_y(currentDis, dirToPlayer);
	} else {
		x += lengthdir_x(moveSpeed, dirToPlayer);
		y += lengthdir_y(moveSpeed, dirToPlayer);
	}
	
}

function checkIfInPlayerMagnetRange() {
	//point_distance < sqrt(sqr(spritelength) + sqr(spriteheight) + obj_player.magnetradius (formula I currnetly have for checking if in magnet range
	// Basic Formula (doesn't account for space made by sprites as it is based off center points)-> (point_distance(x, y, obj_Player.x, obj_Player.y) < obj_Player.playerMagnetRadius)
	//if (point_distance(x, y, obj_Player.x, obj_Player.y) - sqrt(sqr(sprite_width) + sqr(sprite_height)) < obj_Player.playerMagnetRadius - sqrt(sqr(obj_Player.sprite_width) + sqr(obj_Player.sprite_height))) {
	if (point_distance(x, y, obj_Player.x, obj_Player.y) < obj_Player.playerMagnetRadius) {
		magnetized = true;
	}
}




