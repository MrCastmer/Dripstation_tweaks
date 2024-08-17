/obj/item/implant/death_alarm
	name = "nanotrasen command biosignaller implant"
	desc = "An alarm which monitors host vital signs and transmits a radio message upon death. Usually implanted into command staff."
	actions_types = null
	verb_say = "broadcasts"
	var/obj/item/radio/radio
	var/static/list/stealth_areas = typecacheof(list(/area/yogs/infiltrator_base, /area/centcom/syndicate_mothership, /area/shuttle/yogs/stealthcruiser, /area/ruin/syndicate_icemoon, /area/ruin/powered/syndicate_lava_base, /area/ruin/space/has_grav/listeningstation, /area/ruin/space/has_grav/syndiederelict))

/obj/item/implant/death_alarm/Initialize(mapload)
	. = ..()
	radio = new(src)
	radio.keyslot = new/obj/item/encryptionkey/headset_cent // Should broadcast both on the secure centcom and common channels to notify both all station and central command dudes.
	radio.listening = FALSE
	radio.recalculateChannels()

/obj/item/implant/death_alarm/activate(cause)
	if(!imp_in)
		return FALSE

	// Location.
	var/area/turf = get_area(imp_in)
	// Name of implant user.
	var/mobname = imp_in.name
	// What is to be said.
	var/message = "[station_name()] COMMAND TEAM ALERT: [mobname]'s lifesig//N&#@$¤#§>..." // Default message for unexpected causes.

	switch(cause)
		if("death")
			if(!is_type_in_typecache(turf, stealth_areas))	//give the syndies a bit of stealth
				message = "[station_name()] COMMAND TEAM ALERT: [mobname]'s lifesigns ceased in [turf.name]!"
		if("emp")
			if(prob(70))	//30% chance to give give gib message
				var/empname = prob(50) ? turf.name : pick(GLOB.teleportlocs)
				message = "[station_name()] COMMAND TEAM ALERT: [mobname]'s lifesigns ceased in [empname]!"	//eh, sorry, implant fried themselves.


	name = "[mobname]'s Biosignaller"
	radio.talk_into(src, message, RADIO_CHANNEL_CENTCOM)
	radio.talk_into(src, message, RADIO_CHANNEL_COMMON)
	qdel(src)

/obj/item/implant/death_alarm/emp_act(severity)
	activate("emp")

/obj/item/implant/death_alarm/on_mob_death(mob/living/L, gibbed)
	if(gibbed)
		activate("gibbed") // Will use default message.
	else
		activate("death")

/obj/item/implant/death_alarm/get_data()
	. = {"<b>Implant Specifications:</b><BR>
		<b>Name:</b>Nanotrasen \"Profit Margin\" Class Employee Biosignaller Implant<BR>
		<b>Life:</b>Until activation<BR>
		<b>Important Notes:</b>Broadcasts a message over an encrypted channel.<BR>
		<HR>
		<b>Implant Details:</b><BR>
		<b>Function:</b>Contains a miniature radio connected to a bioscanner. Broadcasts the death and last known position of the user both over an encrypted radio channel and all stationary.<BR>"
		<b>Integrity:</b> Implant will occasionally be degraded by the body's immune system and thus will occasionally malfunction."}

/obj/item/implanter/death_alarm
	name = "implanter"
	imp_type = /obj/item/implant/death_alarm

/obj/item/implantcase/death_alarm
	name = "implant case - 'Standart Biosignal NT'"
	imp_type = /obj/item/implant/death_alarm