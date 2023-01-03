
function scr_createEnemy(){
	var enemy = instance_create_layer(x, y, "Enemies", obj_Enemy);
	return enemy;
}