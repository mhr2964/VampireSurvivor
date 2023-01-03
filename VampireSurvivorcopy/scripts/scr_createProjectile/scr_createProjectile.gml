
function scr_createProjectile(type, lvl){
	
	var proj = instance_create_layer(x, y, "Projectiles", obj_Projectile);
	with (proj) {
		projectileTypePreset(type, lvl);
		image_speed = 0;
		switch (type) {
			case 0:
				//knife
				projectileDirection = obj_Player.image_xscale;
				break;
			case 1:
				//axe
				projectileDirection = obj_Player.image_xscale;
				break;
		}
	}
	
	return proj;
}