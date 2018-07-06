%[70] A refined fast 2-D DCT algorithm with regular butterfly structure
%book v.2
x = [1 5 9 13; 2 6 10 14; 3 7 11 15; 4 8 12 17];
x1 = [x(1); x(6); x(11); x(16)];
x2 = [x(9); x(2); x(15); x(8)];
x3 = [x(13); x(10); x(7); x(4)];
x4 = [x(5); x(14); x(3); x(12)];

s1 = dct(x1);
s2 = dct(x2);
s3 = dct(x3);
s4 = dct(x4);

a1 = [s1(1)+s3(1); s1(2)+s3(2); s1(3)+s3(3); s1(4)+s3(4)];
a2 = [s2(1)+s4(1); s2(2)+s4(2); s2(3)+s4(3); s2(4)+s4(4)];
a3 = [s1(1)-s3(1); s1(2)-s3(2); s1(3)-s3(3); s1(4)-s3(4)];
a4 = [s2(1)-s4(1); s2(2)-s4(2); s2(3)-s4(3); s2(4)-s4(4)];

b1 = [a1(1)+a2(1); a1(2)+a2(2); a1(3)+a2(3); a1(4)+a2(4)];
b2 = [a1(1)-a2(1); a1(2)-a2(2); a1(3)-a2(3); a1(4)-a2(4)];
b3 = [a3(1); a3(2)+a4(4); a3(3)+a4(3); a3(4)+a4(2)];
b4 = [a4(1); a3(4)-a4(2); a3(3)-a4(3); a3(2)-a4(4)];

y1 = [b1(1); b1(2); b1(3); b1(4)];
y2 = [1/2*b2(1); 1/2*(b2(2)+b2(4)); b2(3); 1/2*(b2(2)-b2(4))];
y3 = [1/2*(b3(1)+b4(3)); 1/2*(b3(2)+b4(2)); 1/2*(b3(3)+b4(1)); b3(4)];
y4 = [1/2*(b3(3)-b4(1)); 1/2*(b3(2)-b4(2)); 1/2*(b3(1)-b4(3)); b4(4)];

y = 1/2 * [y1(1) y4(4) y2(3) y3(4);
    y1(2) y3(1) y2(2) y3(3);
    y1(3) y3(2) y2(1) y4(2);
    y1(4) y4(1) y2(4) y4(3)]

dd = dct2(x)