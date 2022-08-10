local endstops = 0

function onCreate()
    setProperty('skipCountdown', true)
    noteTweenAlpha('backup', '3', 0, 0.01, 'linear')
end

function onCreatePost()
    setProperty('gf.visible', false)
    noteTweenAlpha('backup', '3', 0, 0.01, 'linear')
    setProperty('healthBar.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('scoreTxt.alpha', 0)
end

function onUpdatePost()
    if endstops == 1 and getProperty('endingSong') then 
      if keyJustPressed('accept') or keyJustPressed('back') then
		endSong()
		end  
    end
end
    
function onEndSong()
	endstops = endstops + 1
		if endstops == 1 then
			rank = 'good'
			if ratingFC == 'Clear' then
			rank = 'bad'
			end
			makeLuaSprite('ending','end'..rank,0,0)
            cameraFlash('other','000000', 0.5)
			addLuaSprite('ending',false)
			screenCenter('ending')
			setProperty('ending.antialiasing',false)
			setObjectCamera('ending','other')
            playSound(rank..'end',1,false)
		return Function_Stop;
		end
return Function_Continue
end

function onStepHit()
    health = getProperty('health')
    if curStep == 128 then
        doTweenAlpha('healthy', 'healthBar', 1, 3, 'linear')
        doTweenAlpha('i1', 'iconP1', 1, 3, 'linear')
        doTweenAlpha('i2', 'iconP2', 1, 3, 'linear')
        doTweenAlpha('score', 'scoreTxt', 1, 3, 'linear')
    end
    if curStep == 2267 then
        setProperty('cameraSpeed', getProperty('cameraSpeed')+2)
    end
    if curStep >= 2267 then
        if getProperty('health') > 0.025 then
            setProperty('health', health- 0.0128);
        end
    end
    if curStep == 2816 then
        setProperty('healthBar.alpha', 0)
        setProperty('iconP1.alpha', 0)
        setProperty('iconP2.alpha', 0)
    end
end