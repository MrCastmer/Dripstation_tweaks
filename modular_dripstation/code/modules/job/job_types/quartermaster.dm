/datum/job/qm
	auto_deadmin_role_flags = DEADMIN_POSITION_HEAD
	department_head = list("Captain")
	supervisors = "the captain"
	req_admin_notify = 1
	added_access = list(ACCESS_SECURITY)
	base_access = list(ACCESS_SEC_DOORS, ACCESS_VAULT, ACCESS_EVA, ACCESS_HEADS,
						ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, 
						ACCESS_MINING, ACCESS_MECH_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	mail_goodies = list(
		/obj/item/stack/sheet/mineral/gold = 10,
		/obj/item/circuitboard/machine/emitter = 5,
		/obj/item/survivalcapsule/luxuryelite = 3,
		/obj/item/construction/rcd = 3,
		/obj/item/circuitboard/machine/vending/donksofttoyvendor = 2
	)
	paycheck = PAYCHECK_COMMAND
	departments_list = list(
		/datum/job_department/cargo,
		/datum/job_department/command,
	)
/datum/outfit/job/quartermaster
	id_type = /obj/item/card/id/head
	ears = /obj/item/radio/headset/qm
	backpack_contents = list(/obj/item/melee/classic_baton/telescopic = 1)