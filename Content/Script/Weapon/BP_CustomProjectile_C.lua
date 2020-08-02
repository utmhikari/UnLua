--
-- DESCRIPTION
--
-- @COMPANY **
-- @AUTHOR **
-- @DATE ${date} ${time}
--

require "UnLua"

local BP_CustomProjectile_C = Class("Weapon.BP_ProjectileBase_C")

function BP_CustomProjectile_C:Initialize(Initializer)
    self.BaseColor = Initializer.Color
    self.DamageRatio = Initializer.Ratio or 0.1
end

function BP_CustomProjectile_C:UserConstructionScript()
    self.Super.UserConstructionScript(self)
    self.Damage = self.Damage * self.DamageRatio
    print("Projectile Damage: " .. tostring(self.Damage));
    self.DamageType = UE4.UClass.Load("/Game/Core/Blueprints/BP_DamageType.BP_DamageType_C")
end

function BP_CustomProjectile_C:ReceiveBeginPlay()
    self.Super.ReceiveBeginPlay(self)
    local MID = self.StaticMesh:CreateDynamicMaterialInstance(0)
    if MID then
		MID:SetVectorParameterValue("BaseColor", self.BaseColor)
	end
end

--function BP_CustomProjectile_C:ReceiveEndPlay()
--end

-- function BP_CustomProjectile_C:ReceiveTick(DeltaSeconds)
-- end

--function BP_CustomProjectile_C:ReceiveAnyDamage(Damage, DamageType, InstigatedBy, DamageCauser)
--end

--function BP_CustomProjectile_C:ReceiveActorBeginOverlap(OtherActor)
--end

--function BP_CustomProjectile_C:ReceiveActorEndOverlap(OtherActor)
--end

return BP_CustomProjectile_C
