/obj/item/projectile/plasma/aoe
	name = "default plasma aoe"
	icon_state = "ion"
	armor_penetration = 0
	damage_types = list(BURN = 0)

	var/aoe_strong = 0
	var/aoe_weak = 0 // Should be greater or equal to strong
	var/heat_damage = 0 // FALSE or 0 to disable
	var/emp_strength = 0 // Divides the effects by this amount, FALSE or 0 to disable

	var/fire_stacks = FALSE

/obj/item/projectile/plasma/aoe/on_hit(atom/target)
	if(emp_strength)
		empulse(target, aoe_strong, aoe_weak, strength=emp_strength)
	if(heat_damage)
		heatwave(target, aoe_strong, aoe_weak, heat_damage, fire_stacks, armor_penetration)
	..()

/obj/item/projectile/plasma/aoe/ion
	name = "ion-plasma bolt"
	icon_state = "ion"
	armor_penetration = 0
	damage_types = list(BURN = 27)

	aoe_strong = 1
	aoe_weak = 1
	heat_damage = 20
	emp_strength = 2

	fire_stacks = FALSE

/obj/item/projectile/plasma/aoe/ion/light
	name = "light ion-plasma bolt"
	armor_penetration = 0
	damage_types = list(BURN = 20)

	aoe_strong = 0
	aoe_weak = 1
	heat_damage = 20
	emp_strength = 3

	fire_stacks = FALSE

/obj/item/projectile/plasma/aoe/heat
	name = "high-temperature plasma blast"
	armor_penetration = 50
	damage_types = list(BURN = 20)

	aoe_strong = 1
	aoe_weak = 1
	heat_damage = 20
	emp_strength = 0

	fire_stacks = TRUE

/obj/item/projectile/plasma/aoe/heat/strong
	name = "high-temperature plasma blast"
	armor_penetration = 25
	damage_types = list(BURN = 33)

	aoe_strong = 1
	aoe_weak = 2
	heat_damage = 30
	emp_strength = 0

	fire_stacks = TRUE