//Default Constructor
function EnemyDefault(){
	//EnemySystemVariables
	enemyDir = 0;
	enemyHealth = 10;
	enemyHspd = 0;
	enemyVspd = 0;
	enemyInvulnerabilityTimer = 0;
	enemyTarget = 0;
	x = 0;
	y = 0;
	
	//StatVariables
	enemyContactDamage = 10;
	enemyInvulnerabilityFrames = 20;
	enemyMaxHealth = 10;
	enemySpeed = 1;
	
	//MiscVariables
	enemyDropTable = undefined;
}

//Initializing this Enemy's variables
EnemyDefault();


//Parameterized Constructor
function EnemyParam(eX, eY, eHealth, eMaxHealth, eContactDamage, eInvulnerabilityFrames, eSpeed, eDir, eDropTable){
	//EnemySystemVariables
	enemyDir = eDir;
	enemyHealth = eHealth;
	enemyHspd = 0;
	enemyVspd = 0;
	enemyInvulnerabilityTimer = 0;
	enemyTarget = 0;
	x = eX;
	y = eY;
	
	//StatVariables
	enemyContactDamage = eContactDamage;
	enemyInvulnerabilityFrames = eInvulnerabilityFrames;
	enemyMaxHealth = eMaxHealth;
	enemySpeed = eSpeed;
	
	//MiscVariables
	enemyDropTable = eDropTable;
}

function enemyDeath() {
	//Should also reference 
	instance_destroy();
}

function enemyHeal(healAmount) {
	enemyHealth += healAmount;
	if (enemyHealth > enemyMaxHealth)
	{
		enemyHealth = enemyMaxHealth;	
	}
}

function enemyMovement()
{
	enemyDir = point_direction(x, y, obj_Player.x + enemyTarget, obj_Player.y + enemyTarget);
	enemyHspd = lengthdir_x(enemySpeed, enemyDir);
	enemyVspd = lengthdir_y(enemySpeed, enemyDir);

	x += enemyHspd;
	y += enemyVspd;
	
	//Sprite stuff
	if (sign(enemyHspd) != 0) {
		image_speed = 1;
		image_xscale = sign(enemyHspd)
	} else {
		image_speed = 0;		
		image_index = 0;
	}
}

function enemyInitializeTarget(enemyTargetOffset)
{
	if (point_distance(x, y, obj_Player.x - enemyTargetOffset, obj_Player.y - enemyTargetOffset) 
	  > point_distance(x, y, obj_Player.x + enemyTargetOffset, obj_Player.y + enemyTargetOffset))
	{
		enemyTarget = enemyTargetOffset;
	}
	else
	{
		enemyTarget = enemyTargetOffset  * -1;
	}
}
enemyInitializeTarget(20);

function enemyUpdateTarget()
{
	if (point_distance(x, y, obj_Player.x + enemyTarget, obj_Player.y + enemyTarget) < 10)
	{
		enemyTarget *= -1;
	}
}

function enemyTakeDamage(damage)
{
	enemyHealth -= damage;
	enemyInvulnerabilityTimer = enemyInvulnerabilityFrames;
}

function enemyCollision()
{
	//Fill in 
}

