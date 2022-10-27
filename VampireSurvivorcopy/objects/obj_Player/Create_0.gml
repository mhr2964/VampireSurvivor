

function Player() {
	//Stat Variables
	playerDefense = 0;
	playerMaxHealth = 1000;
	playerSpeed = 5;
	playerRegen = 0; // This added to the playerHealth every frame, so make sure it's low like 0.0001 or some shit like that
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
				//SmallExpPickup + 1 exp
				playerEXP += 1;
				break;
			case 1:
				//MediumEXP pickup + 100
				playerEXP += 100;
				break;
			case 2:
				//largeEXP pickup + 1000 exp
				playerEXP += 1000;
				break;
			case 3:
				//Goldocoin pickup + 1 to money
				playerMoney += 1;
				break;
			case 4:
				//Golba bag pickup + 10 to money
				playerMoney += 10;
				break;
			case 5:
				//Wall chicken
				playerHeal(playerMaxHealth / 5);
				break;
			case 6:
				//Big Magnet
				with (obj_Management) {
					magenetizeAll()
				}
				break;
			case 7:
				//cross
				with (obj_Management) {
					screenWipe();	
				}
				break;
			case 8:
				//Treasure Chest
				openChest()
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
	//Movement
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
	
	//Sprite stuff
	if (sign(playerHspd) != 0 || sign(playerVspd) != 0) {
		image_speed = 1;	
		if (sign(playerHspd) != 0) image_xscale = sign(playerHspd)
	} else {
		image_speed = 0;	
		image_index = 0;
	}

	
}

function playerLevelUp() {
	playerEXP -= playerEXPThreshold;
	if (playerEXP < 0) playerEXP = 0;
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
	if (playerInvulnerabilityTimer <= 0) { 
		playerHealth -= abs(damage - (playerDefense / 60)); //current defense calculations are wonky cause I haven't decided how to do that yet
		if (playerHealth <= 0) playerDeath();
		else {
			playerInvulnerabilityTimer = playerInvulnerabilityFrames;	
		}
	}
}

function openChest() {
		
}


Player();