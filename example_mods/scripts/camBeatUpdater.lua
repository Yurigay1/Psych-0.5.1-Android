function onBeatHit()
    runHaxeCode([[
        if (game.generatedMusic && !game.endingSong && !game.isCameraOnForcedPos)
        game.moveCameraSection();
    ]])
end

--psych 0.6+ makes the camera update every 4th beat, this reverts that