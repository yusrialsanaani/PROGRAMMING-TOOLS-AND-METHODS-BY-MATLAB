largeL = zeros(36);
%mask = [6 7 30 31];
largeL(mask,mask) = .3*ones(4);
largeL(18:19,18:19) = .5*ones(2);
xx = [1:5,5:6,6:15,15:16,16:25,25:26,26:30];
[XX,YY] = meshgrid(xx) ;
axis([1 30 1 30 0 .5],'off');
surface(XX,YY,largeL,'facecolor',[.5 .5 .5],'edgecolor','none');
light;
colormap(gray);
view([-20,30]);
title('The set of tent poles')