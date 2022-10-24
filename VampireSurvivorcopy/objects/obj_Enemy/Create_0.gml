//Default Constructor
function EnemyDefault(){
	//EnemySystemVariables
	enemyHealth = 10;
	enemyInvulnurabiltyTimer = 0;
	
	//StatVariables
	enemyContactDamage = 10;
	enemyInvulnurabilityFrames = 5;
	enemyMaxHealth = 10;
	enemySpeed = 10;
}

//Parameterized Constructor
function EnemyParam(eHealth, eMaxHealth, eContactDamage, eSpeed){
	enemyHealth = eHealth;
	enemyMaxHealth = eMaxHealth;
	enemyContactDamage = eContactDamage;
	enemySpeed = eSpeed;
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
	//Left empty to copy code from obj_Player
}