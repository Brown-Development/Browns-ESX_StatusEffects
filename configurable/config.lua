Config = {}

-- NOTIFICATIONS --
Config.Notifications = 'ox_lib' -- 'ox_lib', 'okok', or 'custom' (if 'custom' then put the notify logic in 'configurable/notify.lua')
Config.Title = 'Health' -- the Title of the Notification
Config.Message = 'Check your Food and Water' -- The Notification Message
Config.Type = 'error' -- the Notification Type
Config.Duration = 30 -- (in Seconds) the duration of the notification [Should Keep this 30 + to catch peoples attention so they can eat/drink]

-- HUNGER/THIRST --
Config.HungerAmount = 20 -- highest amount of hunger the player must have for the effects to start
Config.ThirstAmount = 20 -- highest amount of thirst the player must have for the effects to start

-- EFFECT -- 
-- list of effects:  https://forum.cfx.re/t/all-gta-v-screen-effects/2028172 --
-- video showcasing effects: https://www.youtube.com/watch?v=JtW9hcKKumQ --
Config.Effect = 'RaceTurbo' -- What type of effect do you want tp play on players screen when they are hungry

-- DATABASE/OPTIMIZATION --
--**PLEASE DONT TOUCH IF YOU DONT KNOW WHAT YOUR DOING**--
--**IF YOU TOUCH IT AND YOU START GETTING ERRORS AND THINGS BREAK, YOUR FAULT NOT MINES LOL**--
Config.NewPlayerCheck = 1.5 -- (In Seconds) How often should the server check for newley chreated players to begin loading their hunger/thirst data 
Config.GenerateData = 2.5 -- (In Seconds) How often should the server generate new player food/thirst data to store in the database & process it client sided to define if the effects should show or not

-- SOUND --
-- to replace the sound navigate to 'html/audio' and place your audio file in .ogg format there and make sure you name it 'heartbeat' (replace the old one)
-- make sure the sound is at least 1 second long.