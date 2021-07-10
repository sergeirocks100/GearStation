/datum/species/android
	name = "Android"
	id = "android"
	say_mod = "states"
	species_traits = list(NOAPPENDIX)
	inherent_traits = list(TRAIT_NOMETABOLISM,TRAIT_TOXIMMUNE,TRAIT_RESISTHEAT,TRAIT_NOBREATH,TRAIT_RESISTCOLD,TRAIT_RESISTHIGHPRESSURE,TRAIT_RESISTLOWPRESSURE,TRAIT_RADIMMUNE,TRAIT_NOFIRE,TRAIT_PIERCEIMMUNE,TRAIT_NOHUNGER,TRAIT_LIMBATTACHMENT,TRAIT_NOCLONELOSS)
	inherent_biotypes = MOB_HUMANOID|MOB_ROBOTIC
	meat = null
	mutantlungs = /obj/item/organ/lungs/cybernetic
	mutantheart = /obj/item/organ/heart/cybernetic
	mutantliver = /obj/item/organ/liver/cybernetic
	mutantstomach = /obj/item/organ/stomach/cybernetic
	mutanteyes = /obj/item/organ/eyes/robotic/basic
	mutantears = /obj/item/organ/ears/cybernetic
	mutanttongue = /obj/item/organ/tongue/robot
	damage_overlay_type = "synth"
	species_language_holder = /datum/language_holder/synthetic
	limbs_id = "synth"
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_PRIDE | MIRROR_MAGIC | RACE_SWAP | ERT_SPAWN | SLIME_EXTRACT

/datum/species/android/on_species_gain(mob/living/carbon/C)
	. = ..()
	for(var/X in C.bodyparts)
		var/obj/item/bodypart/O = X
		O.change_bodypart_status(BODYPART_ROBOTIC, FALSE, TRUE)

/datum/species/android/on_species_loss(mob/living/carbon/C)
	. = ..()
	for(var/X in C.bodyparts)
		var/obj/item/bodypart/O = X
		O.change_bodypart_status(BODYPART_ORGANIC,FALSE, TRUE)
