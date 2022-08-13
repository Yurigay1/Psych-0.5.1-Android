function onEvent(name,val1,val2)
    if name == "Dad Strumline Visibility" then
        for i = 0,3 do getProperty('opponentStrums.alpha')
        noteTweenAlpha('opponent0','0',val1, val2,'linear')
        noteTweenAlpha('opponent1','1',val1, val2,'linear')
        noteTweenAlpha('opponent2','2',val1, val2,'linear')
        noteTweenAlpha('opponent3','3',val1, val2,'linear')
    end
end
end