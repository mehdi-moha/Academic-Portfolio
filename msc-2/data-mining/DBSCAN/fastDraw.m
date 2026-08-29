function fastDraw()
persistent useLimitRate

if isempty(useLimitRate)
    useLimitRate = true;
end

if useLimitRate
    try
        drawnow limitrate;
    catch
        useLimitRate = false;
        drawnow;
    end
else
    drawnow;
end
end