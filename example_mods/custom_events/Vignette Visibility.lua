function onEvent(name,val1,val2)
    if name == "Vignette Visibility" then
        doTweenAlpha('appe', 'vignette', val1, val2, 'linear')
    end
end