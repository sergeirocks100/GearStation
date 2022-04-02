#define JOB_MODIFICATION_MAP_NAME "Old-Fashioned Donut"

MAP_REMOVE_JOB(lawyer)
MAP_REMOVE_JOB(shaft_miner)
MAP_REMOVE_JOB(paramedic)
MAP_REMOVE_JOB(chemist)
MAP_REMOVE_JOB(psychologist)
MAP_REMOVE_JOB(warden)
MAP_REMOVE_JOB(prisoner)
MAP_REMOVE_JOB(mining)

/datum/job/roboticist/New()
	..()
	MAP_JOB_CHECK
	total_positions = 2
	spawn_positions = 2
	department_head = list("Chief Medical Officer")
	supervisors = "the chief medical officer"
	access = list(ACCESS_ROBOTICS, ACCESS_MEDICAL, ACCESS_TECH_STORAGE, ACCESS_MORGUE, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_ROBOTICS, ACCESS_MEDICAL, ACCESS_TECH_STORAGE, ACCESS_MORGUE, ACCESS_MECH_MEDICAL, ACCESS_MINERAL_STOREROOM)

/datum/outfit/job/roboticist/New()
	..()
	MAP_JOB_CHECK
	ears = /obj/item/radio/headset/headset_med
	backpack = /obj/item/storage/backpack/medic
	satchel = /obj/item/storage/backpack/satchel/med
	duffelbag = /obj/item/storage/backpack/duffelbag/med
	
/datum/job/geneticist/New()
	..()
	MAP_JOB_CHECK
	department_head = list("Chief Medical Officer", "Research Director")
	supervisors = "the chief medical officer and research director"
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_CHEMISTRY, ACCESS_GENETICS, ACCESS_MECH_MEDICAL, ACCESS_RESEARCH, ACCESS_XENOBIOLOGY, ACCESS_ROBOTICS, ACCESS_MINERAL_STOREROOM, ACCESS_TECH_STORAGE)
	minimal_access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_GENETICS, ACCESS_MECH_MEDICAL, ACCESS_RESEARCH, ACCESS_MINERAL_STOREROOM)
