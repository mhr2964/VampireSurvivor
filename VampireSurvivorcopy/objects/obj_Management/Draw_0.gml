if (LevelUpScreen == true) {
	//Draw the screen for levle up and let player choose an upgrade
	draw_rectangle_color(room_width / 2 - room_width / 4, 
		room_height / 8, 
		room_width / 2 + room_width / 4,
		room_height * 7 / 8,
		c_gray, c_gray, c_gray, c_gray, false
		);
}






//Drawing all levels on the left 

//Drawing Weapons
var xOffset = 40;
var yOffset = 160;
var yDifference = 8;
var spriteScale = 1;
var sWidth = sprite_get_width(spr_weapon) * spriteScale 
for (var i = 0; i < ds_list_size(obj_Player.playerWeaponLvlList); i++) {
	draw_sprite_ext(spr_weapon, i, xOffset, yOffset + sWidth * i + yDifference, spriteScale, spriteScale, 0, c_white, 1);
	draw_text(xOffset + sWidth, yOffset + sWidth * i + yDifference, "Lvl: " + string(ds_list_find_value(obj_Player.playerWeaponLvlList, i)));
}

yOffset = 600;
//Drawing Passives
for (var i = 0; i < ds_list_size(obj_Player.playerPassiveList); i++) {
	draw_sprite_ext(spr_passiveItems, i, xOffset, yOffset + sWidth * i + yDifference, spriteScale, spriteScale, 0, c_white, 1);
	draw_text(xOffset + sWidth, yOffset + sWidth * i + yDifference, "Lvl: " + string(ds_list_find_value(obj_Player.playerPassiveList, i)));
	draw_text(xOffset + sWidth * 4, yOffset + sWidth * i + yDifference, "Value: " + string(obj_Player.passiveTypePreset(i, ds_list_find_value(obj_Player.playerPassiveList, i))));
}