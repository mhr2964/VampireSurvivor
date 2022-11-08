if (enemyInvulnerabilityTimer <= 0)
{
	enemyTakeDamage(other.projectileDamage);
	other.projectilePiercing --;
}
