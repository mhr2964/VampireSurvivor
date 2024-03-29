levelUpScreen = false;
levelUpChoices = -1;

screenWipeTime = 60;
screenWipeTimer = -1;

audio_play_sound(sound_gangnam, 0, true, 50);

function gameOver() {
	
}

function magenetizeAll() {
	with (obj_Pickup) {
		magnetized = true;	
	}
}

function screenWipe() {
	screenWipeTimer = screenWipeTime;
	with (obj_Enemy) {
		enemyDeath();	
	}
	with (obj_Candle) {
		candleDestroy();	
	}
}

global.Debug = true;
global.Pause = false;

function Pause() {
	global.Pause = true;
	//if (global.Debug == true) show_message("GamePaused");
	instance_deactivate_all(true);
}

function unPause() {
	global.Pause = false;
	//if (global.Debug == true) show_message("Game Unpaused");
	instance_activate_all()
}

function newLevelUpItem() {
	
	audio_play_sound(sound_joker, 0, 0)
	levelUpScreen = true;
	/* Calculate Odds for levl upgrades 
		- New Weapon or passive
		- Upgrade to weapon or passive
		- Extra money 
	
		- There are 3 random choices
			
	*/
	
	//The items that are possible to be upgraded
	var possibleindexes = ds_list_create()
	//Check weapons
	for (var i = 0; i < sprite_get_number(spr_weapon); i++) {
		var wLvl = ds_list_find_value(obj_Player.playerWeaponLvlList, i);
		if (wLvl < 10) ds_list_add(possibleindexes, i);
	}
	for (var i = 0; i < sprite_get_number(spr_passiveItems); i++) {
		if (ds_list_find_value(obj_Player.playerPassiveList, i) < 10) ds_list_add(possibleindexes, i + sprite_get_number(spr_weapon));
	}
	
	for (var i = 0; i < 3; i++) {
		var pick = irandom_range(0, ds_list_size(possibleindexes) - 1);
		randomize();
		levelUpChoices[i] = ds_list_find_value(possibleindexes, pick);
		ds_list_delete(possibleindexes, pick);
	}
	
	Pause();

}