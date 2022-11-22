function m= maximum(func,par,x)
  h=@(x) func(x,par)
  plot(x,h(x))
  m= max(h(x))
endfunction
