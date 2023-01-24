

function Player() {
	//Stat Variables
	/*
	
	playerSpeed = 5;
	playerRegen = 0; // This added to the playerHealth every frame, so make sure it's low like 0.0001 or some shit like that
	
	playerRevives = 0;
	
	playerMagnetRadius = 100;
	playerExpMultiplyer = 1;
	playerMoneyMultiplyer = 1;*/
	playerCollisionDamage = 0;
	playerInvulnerabilityFrames = 10;
	playerDefense = 0;
	playerMaxHealth = 1000;
	playerRevives = 0;
	
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
	
	
	//Player Weapon initializing
	playerWeaponLvlList = ds_list_create();
	playerWeaponCoolDownList = ds_list_create();
	playerWeaponExtraAmountList = ds_list_create();
	//Initialize playerWeaponLvlList
	for (var i = 0; i < sprite_get_number(spr_weapon); i++) {
		//Set to -1 so that because weapon lvls start at 0 (first level when you aquire them) - 1 means that you don't have weapon
		ds_list_add(playerWeaponLvlList, -1);
		ds_list_add(playerWeaponCoolDownList, -1); 
		ds_list_add(playerWeaponExtraAmountList, 0);
	}
	//Knife testing
	ds_list_set(playerWeaponLvlList, 0, 0);
	ds_list_set(playerWeaponCoolDownList, 0, 60);
	//Axe testing
	ds_list_set(playerWeaponLvlList, 1, 0);
	ds_list_set(playerWeaponCoolDownList, 1, 30);
	
	//Player Passive Ability Initializing
	playerPassiveList = ds_list_create();
	for (var i = 0; i < sprite_get_number(spr_passiveItems); i++) {
		//Set to 0 because passive lvls start at 0, and player starts with all passives
		ds_list_add(playerPassiveList, 0);
		passiveTypePreset(i, 0);
	}
	
	
}

function playerWeapons() {
	//If PlayerWeapon is set to 0, and the cd is -1, it'll start the timer for shootingt he weapon
	for (var i = 0; i < ds_list_size(playerWeaponCoolDownList); i++) {
		var cd = ds_list_find_value(playerWeaponCoolDownList, i);
		if (cd == -1) && (ds_list_find_value(playerWeaponLvlList, i) != -1) ds_list_set(playerWeaponCoolDownList, i, 30);
	}
	
	
	//First tick down all weaponcooldowns every frame
	for (var i = 0; i < ds_list_size(playerWeaponCoolDownList); i++) {
		var cd = ds_list_find_value(playerWeaponCoolDownList, i);
		if (cd != -1) {
			if (cd - 1 == 0) {
				//Shoot weapon
				var proj = scr_createProjectile(i, ds_list_find_value(playerWeaponLvlList, i));
				
				//Set cooldown
				if (proj.projectileExtraAmount != 0) && (ds_list_find_value(playerWeaponExtraAmountList, i) == 0) {
					//Shooting multiple projectiles
					ds_list_set(playerWeaponExtraAmountList, i, proj.projectileExtraAmount);
				} 
				
				if (ds_list_find_value(playerWeaponExtraAmountList, i) != 0) {
					ds_list_set(playerWeaponCoolDownList, i, proj.projectileTimeBetweenShots);
					ds_list_set(playerWeaponExtraAmountList, i, ds_list_find_value(playerWeaponExtraAmountList, i) - 1);
					if (ds_list_find_value(playerWeaponExtraAmountList, i) == 0) ds_list_set(playerWeaponCoolDownList, i, proj.projectileCooldown);
				} else {
					ds_list_set(playerWeaponCoolDownList, i, proj.projectileCooldown);
				}
				
				
			} else {
				ds_list_set(playerWeaponCoolDownList, i, cd - 1);
			}
		}
	}
	
}

function passiveTypePreset(type, lvl) {
	//Sets Playerpassivelist info
	ds_list_set(playerPassiveList, type, lvl);
	
	//Sets actual player stats
	switch (type) {
		case 0:
			//Regen
			playerRegen = 0 + lvl * 00.1;
			return playerRegen;
			break;
		case 1:
			playerMagnetRadius = 100 + lvl * 10;
			return playerMagnetRadius;
			break;
		case 2:
			playerSpeed = 5 + lvl * 0.25;
			return playerSpeed;
			break;
		case 3:
			playerRevives += lvl;
			return playerRevives;
			break;
		case 4:
			playerExpMultiplyer = 1 + lvl * 0.1;
			return playerExpMultiplyer;
			break;
		case 5:
			playerMoneyMultiplyer = 1 + lvl * 0.1;
			return playerMoneyMultiplyer
			break;
	}
}



function playerCollision() {
	//Enemy Collision
	if (place_meeting(x, y, obj_Enemy)) {
		var enemyRef = instance_place(x, y, obj_Enemy);
		with (enemyRef) {
			//Enemy takes damage from player collision here
			enemyHealth -= other.playerCollisionDamage
			enemyInvulnerabilityTimer = enemyInvulnerabilityTimer
		}
		if (instance_exists(enemyRef)) { //important becasue enemy may die to player collision
			playerTakeDamage(enemyRef.enemyContactDamage);
			playerInvulnerabilityTimer = playerInvulnerabilityTimer;
		}
		//Play player take damage sfx here if sound isn't already playing
	}
	//Pickup Coillision
	if (place_meeting(x, y, obj_Pickup)) {
		var pickupRef = instance_place(x, y, obj_Pickup);
		switch (pickupRef.type) {
			case 0:
				//SmallExpPickup + 1 exp
				playerEXP += 1 * playerExpMultiplyer;
				break;
			case 1:
				//MediumEXP pickup + 100
				playerEXP += 100 * playerExpMultiplyer;
				break;
			case 2:
				//largeEXP pickup + 1000 exp
				playerEXP += 1000 * playerExpMultiplyer;
				break;
			case 3:
				//Goldocoin pickup + 1 to money
				playerMoney += 1 * playerMoneyMultiplyer;
				break;
			case 4:
				//Golba bag pickup + 10 to money
				playerMoney += 10 * playerMoneyMultiplyer;
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
	with (obj_Management) {
		newLevelUpItem();
	}
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