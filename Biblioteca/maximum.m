function ans = maximum(func, par, s)

    a = par;
    max_s = s(1);

    plot(s, func(s, a))
    xlim([-5, 5])

    for i = 1:length(s)
        if func(s(i), a) > func(max_s, a)
        max_s = (s(i));
        endif
    endfor

    ans = func(max_s, a);

end