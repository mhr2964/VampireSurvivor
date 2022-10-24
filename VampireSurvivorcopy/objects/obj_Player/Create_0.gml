

function Player() {
	//Stat Variables
	playerDefense = 0;
	playerMaxHealth = 10;
	playerSpeed = 5;
	playerRegen = 0;
	playerCollisionDamage = 0;
	playerRevives = 0;
	playerInvulnerabilityFrames = 10;
	playerMagnetRadius = 100;
	
	//Exp Variables
	playerEXP = 0;
	playerEXPThreshold = 5;
	playerLevel = 1;
	
	//Misc Variables
	playerMoney = 0;
	
	//PlayerSystemVariables
	playerHealth = playerMaxHealth
	playerInvulnerabilityTimer = 0;
	playerVspd = 0;
	playerHspd = 0;
	playerDir = 0; 
	

}



function playerCollision() {
	//Enemy Collision
	if (place_meeting(x, y, obj_Enemy)) {
		var enemyRef = instance_place(x, y, obj_Enemy);
		with (enemyRef) {
			//Enemy takes damage from player collision here
		}
		if (instance_exists(enemyRef)) { //important becasue enemy may die to player collision
			playerTakeDamage(enemyRef.enemyContactDamage);
		}
		//Play player take damage sfx here if sound isn't already playing
	}
	//Pickup Coillision
	if (place_meeting(x, y, obj_Pickup)) {
		var pickupRef = instance_place(x, y, obj_Pickup);
		switch (pickupRef.type) {
			case 0:
				
				break;
		}
		
		if (instance_exists(pickupRef)) {
			with (pickupRef) {
				instance_destroy();
			}
		}
		//Play playerp pickup sfx here if sound isn't already playing
	}
}

function playerMovement() {
	playerDir = point_direction(0, 0, keyboard_check(global.rightKey) - keyboard_check(global.leftKey), keyboard_check(global.downKey) - keyboard_check(global.upKey));
	playerHspd = lengthdir_x(playerSpeed * (keyboard_check(global.rightKey) - keyboard_check(global.leftKey) != 0), playerDir);
	playerVspd = lengthdir_y(playerSpeed * (keyboard_check(global.downKey) - keyboard_check(global.upKey) != 0), playerDir);
	if (place_meeting(x + playerHspd + sign(playerHspd) * sprite_width / 2, y, obj_Wall)) {
		while (!place_meeting(x + sign(playerHspd) + sign(playerHspd) * sprite_width / 2, y, obj_Wall)) {
			x += sign(playerHspd);	
		}
		playerHspd = 0;
	}
	x += playerHspd;
	
	
	
	if (place_meeting(x, y + playerVspd + sign(playerVspd) * sprite_height / 2, obj_Wall)) {
		while (!place_meeting(x, y + sign(playerVspd) + sign(playerVspd) * sprite_height / 2, obj_Wall)) {
			y += sign(playerVspd);	
		}
		playerVspd = 0;
	}
	y += playerVspd;
	

}

function playerLevelUp() {
	playerEXP = 0;
	playerLevel += 1;
	playerEXPThreshold = sqr(playerLevel);
	show_message("playerlevelUp");
	newLevelUpItem();
	
}

function newLevelUpItem() {
	show_message("newLevelUpItem ran");
}

function playerHeal(healAmount) {
	playerHealth += healAmount;
	if (playerHealth > playerMaxHealth) playerHealth = playerMaxHealth;
}

function playerDeath() {
	show_message("player has died");	
	if (playerRevives > 0) {
		playerRevive();
		playerRevives--;
	}
}

function playerRevive() {
	show_message("Player Revived")
}

function playerTakeDamage(damage) {
	playerHealth -= damage;
	if (playerHealth <= 0) playerDeath();
	else {
		playerInvulnerabilityTimer = playerInvulnerabilityFrames;	
	}
}



Player();