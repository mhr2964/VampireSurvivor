LevelUpScreen = false;


function gameOver() {
	
}

function magenetizeAll() {
	with (obj_Pickup) {
		magnetized = true;	
	}
}

function screenWipe() {
	
}

global.Debug = true;
global.Pause = false;

function Pause() {
	global.Pause = true;
	if (global.Debug == true) show_message("GamePaused");
	instance_deactivate_all(true);
}

function unPause() {
	global.Pause = false;
	if (global.Debug == true) show_message("Game Unpaused");
	instance_activate_all()
}

function newLevelUpItem() {
	show_message("newLevelUpItem ran");
	Pause();
	LevelUpScreen = true;
	/*Calculate Odds for levl upgrades 
		Each upgrade is either an upgrade to a 
		an upgrade to a passive
		or a new iweapon or passive
		
	*/
}