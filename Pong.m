clear; clc; close;

%-------Setup---------
p1score=0;                     %player scores
p2score=0;

pongFig = figure('color','black','keypressfcn',@keyboardFcn, 'units','normal','position',[.1 .1 .8 .8]);    %setup the background screen
pongAxes= axes('color','white','XLim',[0,100],'YLim',[-5,100],'xtick',[],'ytick',[]);

pongBallVel=[1.5 1];                                                                              %ball position and velocity
pongBallPos=[20,40];
pongBall= line(pongBallPos(1),pongBallPos(2),'marker','.','markersize',20,'color','blue');

global pongBlock1Center;                                                                          %player1 paddle
pongBlock1Center=45;
pongBlock1= line([pongBlock1Center-7 pongBlock1Center+7],[-4 -4],'linewidth',4,'color','green');

global pongBlock2Center;                                                                          %player2 paddle
pongBlock2Center=45;
pongBlock2= line([pongBlock2Center-7 pongBlock2Center+7],[99 99 ],'linewidth',4,'color','red');


%-------Loop------------

while true                                         
  
  if pongBallPos(1)<0 || pongBallPos(1)>100                 %bounce on the sides
    pongBallVel(1)= -pongBallVel(1);
  end 
  if pongBallPos(2)<-2
    if abs(pongBallPos(1) - pongBlock1Center)<8             %not miss      
      pongBallVel(2)= -pongBallVel(2);
    else
      pause(1);                                             %misses the ball
      p2score=p2score+1; 
      pongBallPos=[50,50];
      if p2score==11
        text(90,50,['Red:' num2str(p2score) '/11'],'FontSize',18,'BackgroundColor','white');
        text(35,50,'PLAYER RED WINS', 'FontSize',25,'BackgroundColor','RED');
        pause(5);
        close all; return;
      end
    end
  end
  if pongBallPos(2)>96
    if abs(pongBallPos(1) - pongBlock2Center)<8               %not miss
      pongBallVel(2)= -pongBallVel(2);
    else
      pause(1);                                               %misses the ball
      p1score=p1score+1;
      pongBallPos=[50,50];
      if p1score==11
        text(5,50,['Green:' num2str(p1score) '/11'], 'FontSize',18,'BackgroundColor','white');
        text(35,50,'PLAYER GREEN WINS', 'FontSize',25,'BackgroundColor','GREEN');
        pause(5);
        close all; return;
      end
    end
  end
  
  pongBallPos=pongBallPos+pongBallVel;
  set(pongBall,'XData',pongBallPos(1),'YData',pongBallPos(2));                                %sets the new position of ball and the padels
  set(pongBlock1, 'XData',[pongBlock1Center-7 pongBlock1Center+7]);
  set(pongBlock2, 'XData',[pongBlock2Center-7 pongBlock2Center+7]);
  text(5,50,['Green:' num2str(p1score) '/11'], 'FontSize',18,'BackgroundColor','white');      %score boards
  text(90,50,['Red:' num2str(p2score) '/11'],'FontSize',18,'BackgroundColor','white');
  pause(.03);
  
end
