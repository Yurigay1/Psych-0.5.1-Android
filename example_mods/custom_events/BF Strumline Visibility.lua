function onEvent(name,val1,val2)
    if name == "BF Strumline Visibility" then
        for i = 0,3 do getProperty('playerStrums.alpha')
        noteTweenAlpha('bf0','4',val1, val2,'linear')
        noteTweenAlpha('bf1','5',val1, val2,'linear')
        noteTweenAlpha('bf2','6',val1, val2,'linear')
        noteTweenAlpha('bf3','7',val1, val2,'linear')
    end
end
end