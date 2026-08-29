function res = runWallFollow(M, start, goal, handRule, maxSteps)
dirs = [-1, 0; 0, 1; 1, 0; 0, -1]; % N,E,S,W
if strcmpi(handRule, 'right')
    orderFcn = @(h) [mod(h, 4) + 1, h, mod(h+2, 4) + 1, mod(h+1, 4) + 1]; % right, straight, left, back
else
    orderFcn = @(h) [mod(h+2, 4) + 1, h, mod(h, 4) + 1, mod(h+1, 4) + 1]; % left, straight, right, back
end
inB = @(p) p(1) >= 1 && p(1) <= size(M, 1) && p(2) >= 1 && p(2) <= size(M, 2);

pos = start;
heading = 2; % start heading East
path = pos;
visited = false(size(M, 1), size(M, 2), 4);
found = false;

for k = 1:maxSteps
    visited(pos(1), pos(2), heading) = true;
    candDirs = orderFcn(heading);
    moved = false;
    for ci = 1:4
        d = candDirs(ci);
        np = pos + dirs(d, :);
        if inB(np) && M(np(1), np(2)) == 0
            pos = np;
            heading = d;
            path = [path; pos];
            moved = true;
            break;
        end
    end
    if ~moved
        break;
    end
    if isequal(pos, goal)
        found = true;
        break;
    end
    if visited(pos(1), pos(2), heading)
        break;
    end
end
res.found = found;
res.steps = size(path, 1) - 1;
res.path = path;
end