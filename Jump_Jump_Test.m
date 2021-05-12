n = 0;
h = figure;
robo1 = java.awt.Robot;
robot2 = java.awt.Robot;
for i = 1:100
    if n==0
        close(h);
    end
t = java.awt.Toolkit.getDefaultToolkit();
rec = java.awt.Rectangle(t.getScreenSize());
image = robo1.createScreenCapture(rec);
filehandle = java.io.File('xxx.png');
javax.imageio.ImageIO.write(image,'png',filehandle);
a=imread('xxx.png');
n = n+1; 
if n ==1
imshow(a)
Rectangle = drawrectangle;
Rect = round(Rectangle.Position);
else
a = a(Rect(2):Rect(2)+Rect(4),...
       Rect(1):Rect(1)+Rect(3),:);
imshow(a)
point1 = drawpoint;
Position1 = point1.Position;
point2 = drawpoint;
Position2 = point2.Position;
Distance = sum((Position2-Position1).^2)^0.5;
ratio = 0.004;
Time = Distance*ratio;
robot2.mouseMove(Rect(1)+Rect(3)/2, Rect(2)+Rect(4)/2)
robot2.mousePress  (java.awt.event.InputEvent.BUTTON1_MASK);
pause(Time)
robot2.mouseRelease(java.awt.event.InputEvent.BUTTON1_MASK);
pause(1);
end
end