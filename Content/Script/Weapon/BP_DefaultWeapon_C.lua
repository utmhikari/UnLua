require "UnLua"

local ProjectileInitializer = require "Base/Projectile/ProjectileInitializer"

local BP_DefaultWeapon_C = Class("Weapon.BP_WeaponBase_C")

function BP_DefaultWeapon_C:UserConstructionScript()
	self.Super.UserConstructionScript(self)
	self.InfiniteAmmo = true
	self.ProjectileClass = UE4.UClass.Load("/Game/Core/Blueprints/Weapon/BP_CustomProjectile")
	self.MuzzleSocketName = "Muzzle"
	self.World = self:GetWorld()
end

function BP_DefaultWeapon_C:SpawnProjectile()
	if self.ProjectileClass then
		local Transform = self:GetFireInfo()
		local Projectile = self.World:SpawnActor(
			self.ProjectileClass,
			Transform,
			UE4.ESpawnActorCollisionHandlingMethod.AlwaysSpawn,
			self,
			self.Instigator,
			"Weapon.BP_CustomProjectile_C",
			ProjectileInitializer:GetInitializer())
	end
end

return BP_DefaultWeapon_C
