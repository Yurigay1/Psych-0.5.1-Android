function onEvent(name,val1,val2)
    if name == "Screen in Darkness" then
        doTweenAlpha('diss', 'darkness', val1, val2, 'linear')
    end
end