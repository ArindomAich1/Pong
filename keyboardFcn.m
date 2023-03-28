%-------Function--------
function keyboardFcn(figure,event)
  
  
  global pongBlock1Center;
  switch event.Key
    case 'a'
      pongBlock1Center= pongBlock1Center-2;
    case 'd'
      pongBlock1Center= pongBlock1Center+2;
  end
  
  global pongBlock2Center;
  switch event.Key
    case 'h'
      pongBlock2Center= pongBlock2Center-2;
    case 'l'
      pongBlock2Center= pongBlock2Center+2;
  end
  
end
