/obj/item/clothing/gloves
	name = "gloves"
	gender = PLURAL //Carn: for grammarically correct text-parsing
	w_class = WEIGHT_CLASS_SMALL
	icon = 'icons/obj/clothing/gloves.dmi'
	siemens_coefficient = 0.5
	body_parts_covered = HANDS
	slot_flags = ITEM_SLOT_GLOVES
	attack_verb = list("challenged")
	var/transfer_prints = FALSE
	strip_delay = 20
	equip_delay_other = 40
	// Path variable. If defined, will produced the type through interaction with wirecutters.
	var/cut_type = null

/obj/item/clothing/gloves/ComponentInitialize()
	. = ..()
	RegisterSignal(src, COMSIG_COMPONENT_CLEAN_ACT, .proc/clean_blood)

/obj/item/clothing/gloves/proc/clean_blood(datum/source, strength)
	if(strength < CLEAN_STRENGTH_BLOOD)
		return
	transfer_blood = 0

/obj/item/clothing/gloves/suicide_act(mob/living/carbon/user)
	user.visible_message("<span class='suicide'>\the [src] are forcing [user]'s hands around [user.p_their()] neck! It looks like the gloves are possessed!</span>")
	return OXYLOSS

/obj/item/clothing/gloves/worn_overlays(isinhands = FALSE)
	. = list()
	if(!isinhands)
		if(damaged_clothes)
			. += mutable_appearance('icons/effects/item_damage.dmi', "damagedgloves")
		if(HAS_BLOOD_DNA(src))
			. += mutable_appearance('icons/effects/blood.dmi', "bloodyhands")

/obj/item/clothing/gloves/update_clothes_damaged_state(damaged_state = CLOTHING_DAMAGED)
	..()
	if(ismob(loc))
		var/mob/M = loc
		M.update_inv_gloves()

// Called just before an attack_hand(), in mob/UnarmedAttack()
/obj/item/clothing/gloves/proc/Touch(atom/A, proximity)
	return 0 // return 1 to cancel attack_hand()

/obj/item/clothing/gloves/attackby(obj/item/I, mob/user, params)
	if(I.tool_behaviour == TOOL_WIRECUTTER || I.get_sharpness())
		if(!cut_type)
			return
		if(icon_state != initial(icon_state))
			return // We don't want to cut dyed gloves.
		to_chat(user, "<span class='notice'>You cut the fingertips off of [src].</span>")
		qdel(src)
		user.put_in_hands(new cut_type)
	else
		return
