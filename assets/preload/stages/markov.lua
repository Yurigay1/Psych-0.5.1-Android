local bit = 2

function onCreate()
    makeLuaSprite('skylol','sky1', -200, 50)
    setScrollFactor('skylol', 0, 0.6)
    scaleObject('skylol', 0.6, 0.6)
    addLuaSprite('skylol')

    makeLuaSprite('bg1', 'bg1', -450, -140)
    setScrollFactor('bg1', 0.8, 0.9)
    scaleObject('bg1', 0.9, 0.9)
    addLuaSprite('bg1')

    makeLuaSprite('fg1', 'fg1', -440, -158)
    scaleObject('fg1', 0.9, 0.9)
    addLuaSprite('fg1')

    makeLuaSprite('skyagain', 'sky2', -200, 50)
    setScrollFactor('skyagain', 0, 0.6)
    scaleObject('skyagain', 0.6, 0.6)
    addLuaSprite('skyagain')

    makeLuaSprite('bg2', 'bg2', -500, -290)
    setScrollFactor('bg2', 0.9,0.9)
    addLuaSprite('bg2')

    makeLuaSprite('fg2', 'fg2', -800, -250)
    addLuaSprite('fg2')

    makeLuaSprite('bg3', 'bg2', -500, -250)
    setScrollFactor('bg3', 0.9,0.9)
    addLuaSprite('bg3')

    makeLuaSprite('fg3', 'fg2', -800, 0)
    addLuaSprite('fg3')

    makeLuaSprite('ending', 'eeps', -500, -500)
    scaleObject('ending', 3, 3)
    setScrollFactor('ending', 0, 0)
    addLuaSprite('ending', false)

    makeLuaSprite('darkness', 'oops', 0,0)
    setObjectCamera('darkness', 'hud')
    addLuaSprite('darkness')

    makeLuaSprite('vignette', 'vignette', 0, 0)
    setObjectCamera('vignette', 'hud')
    addLuaSprite('vignette')
end

function onCreatePost()
    setProperty('ending.alpha', 0)
    setProperty('vignette.alpha', 0)
    setProperty('fg3.alpha', 0)
    setProperty('bg3.alpha', 0)

    makeAnimatedLuaSprite('truck1', 'truck1', -600, -310)
    addAnimationByPrefix('truck1', 'burn', 'truckkun', 14, true)
    scaleObject('truck1', 0.88, 0.88)
    addLuaSprite('truck1')
    objectPlayAnimation('truck1', 'burn')
    setObjectOrder('truck1', 3)

    makeAnimatedLuaSprite('truck2', 'truck2', 280, -430)
    addAnimationByPrefix('truck2', 'burn', 'truck2', 14, true)
    scaleObject('truck2', 1.2, 1.2)
    addLuaSprite('truck2')
    objectPlayAnimation('truck2', 'burn')
    setObjectOrder('truck2', 9)
end

function onStepHit()
    if curStep == 2267 then
        setProperty('fg3.alpha', 1)
        setProperty('bg3.alpha', 1)
        setProperty('skyagain.alpha', 1)
        setProperty('truck2.alpha', 1)
        setProperty('truck2.y', -181)
    end
    if curStep == 2832 then
        setProperty('ending.alpha',1)
    end
end

function onUpdatePost()
    if endstops == 1 and getProperty('endingSong') then 
      if keyJustPressed('accept') or keyJustPressed('back') then
		endSong()
		end  
    end
end

function onEndSong()
	bit = bit - 1
	if isStoryMode and bit >0 then --Block the first countdown
		if bit == 1 then
			rank = 'good'
			if ratingFC == 'Clear' then
			rank = 'bad'
			end
			makeLuaSprite('ending','end'..rank,0,0)
			addLuaSprite('ending',false)
			scaleObject('ending',2,2)
			screenCenter('ending')
			setProperty('ending.antialiasing',false)
			setObjectCamera('ending','other')
			playMusic(rank..'end',1,false)
		return Function_Stop;
		end
	end
	if bit == 0 then
	return Function_Continue;
	end
end

function onBeatHit()
    if curBeat == 112 or curBeat == 377 then
        setProperty('fg2.alpha', 0)
        setProperty('bg2.alpha', 0)
        setProperty('skyagain.alpha', 0)
        setProperty('truck2.alpha', 0)
    end
    if curBeat == 247 then
        setProperty('fg2.alpha', 1)
        setProperty('bg2.alpha', 1)
        setProperty('skyagain.alpha', 1)
        setProperty('truck2.alpha', 1)
    end
end