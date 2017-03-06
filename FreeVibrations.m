%Input values - default
Y=20;
B=pi/12;
l1 = 10;
l2 = 14;
k1 = 200;
k2 = 300;
m = 20;
J = 1000;
%------------------------
%Initial Calculations
a = (k1+k2)/m;
b = ((k1*l1)-(k2*l2))/m;
c = ((k1*l1*l1)+(k2*l2*l2))/J;
r = sqrt(J/m);
z = (((c-a)*(c-a))/4)+((b*b)+(r*r));

if b==0
    w1 = sqrt(a);
    w2 = sqrt(c);
else
    w1 = sqrt(((a+c)/2)-(sqrt(z)));
    w2 = sqrt(((a+c)/2)+(sqrt(z)));
end

if isreal(w1)
    w=w1;
else
    w=w2;
end

axis square equal;
axis([-60 60 -60 60]);
title('Free Vibration');
grid off;
hold on;

% for
%     line([-50 ],G1s0y,'Linewidth',2,'color',[1 0 0]);
%Main loop containing frames
for t = 1:0.01:1000
    

    cla(gca);
    
    y = Y*cos(w*t);
    theta = B*cos(w*t);

        
    Bx = ((l2+10)*cos(theta))+(5*sin(theta));
    By = -((l2+10)*sin(theta))+(5*cos(theta))-y;

    Cx = ((l2+10)*cos(theta))-(5*sin(theta));
    Cy = -((l2+10)*sin(theta))-(5*cos(theta))-y;

    Ax = Bx - ((l1+l2+20)*cos(theta));
    Ay = By + ((l1+l2+20)*sin(theta));

    Dx = Cx - ((l1+l2+20)*cos(theta));
    Dy = Cy + ((l1+l2+20)*sin(theta));
        
    ABx = [Ax Bx];
    ABy = [Ay By];
    
    BCx = [Bx Cx];
    BCy = [By Cy];
    
    CDx = [Cx Dx];
    CDy = [Cy Dy];
    
    ADx = [Ax Dx];
    ADy = [Ay Dy];

    Px = -l1;
    Py = Dy+((Cy-Dy)*(-l1-Dx))/(Cx-Dx);

    Qx = l2;
    Qy = Dy+((Cy-Dy)*(l2-Dx))/(Cx-Dx);

    G1x = -l1;
    G1y = -50;

    G2x = +l2;
    G2y = -50;

    PG1x = [Px G1x];
    PG1y = [Py G1y];

    QG2x = [Qx G2x];
    QG2y = [Qy G2y];


    line([-50 50],[-50 -50],'Linewidth',3,'color',[0 0 0]);
    line([-50 50],[0 0],'Linestyle','-.','color',[0 0 0]);
    line([-50 50],[-y -y],'Linestyle','-.','color',[0 0 0]);
    line([0 0],[-60 60],'Linestyle','-.','color',[0 0 0]);
    text(2.5,-y,'G');
    

    line(ABx,ABy,'Linewidth',4,'color',[0 0 0]);
    line(BCx,BCy,'Linewidth',4,'color',[0 0 0]);
    line(CDx,CDy,'Linewidth',4,'color',[0 0 0]);
    line(ADx,ADy,'Linewidth',4,'color',[0 0 0]);


    s1x = zeros(10,1);
    s2x = zeros(10,1);

    s1x(1) = G1x;
    s1x(2) = G1x - 5;
    s1x(3) = G1x + 5;
    s1x(4) = s1x(2);
    s1x(5) = s1x(3);
    s1x(6) = G1x;

    s2x(1) = G2x;
    s2x(2) = G2x - 5;
    s2x(3) = G2x + 5;
    s2x(4) = s2x(2);
    s2x(5) = s2x(3);
    s2x(6) = G2x;

    pitch1 = (Py-G1y)/7;
    pitch2 = (Qy-G2y)/7;
    s1y = zeros(10,1);
    s2y = zeros(10,1);

    for i = 1:1:6
        s1y(i) = G1y + (i)*pitch1;
        s2y(i) = G2y + (i)*pitch2;
    end

    G1s0x = [G1x s1x(1)];
    G1s0y = [G1y s1y(1)];
    G2s0x = [G2x s2x(1)];
    G2s0y = [G2y s2y(1)];
    PS6x = [Px s1x(6)];
    PS6y = [Py s1y(6)];
    QS5x = [Qx s2x(6)];
    QS5y = [Qy s2y(6)];

    text(s1x(4)-7,s1y(4),'K1');
    text(s2x(4)+12,s2y(4),'K2');
    

    text(5,40,num2str(y,'Y: %6.2f mm'));
    text(5,35,num2str(theta*180/pi,'Angle: %6.2f degrees'));
    line(G1s0x,G1s0y,'Linewidth',2,'color',[1 0 0]);
    line(G2s0x,G2s0y,'Linewidth',2,'color',[1 0 0]);
    line(PS6x,PS6y,'Linewidth',2,'color',[1 0 0]);
    line(QS5x,QS5y,'Linewidth',2,'color',[1 0 0]);
    

    for i = 1:1:5
        line([s1x(i) s1x(i+1)],[s1y(i) s1y(i+1)],'Linewidth',2,'color',[1 0 0]);
        line([s2x(i) s2x(i+1)],[s2y(i) s2y(i+1)],'Linewidth',2,'color',[1 0 0]);
    end

    hold off;
    drawnow;
    pause(0.01);
end
    
    




    
    