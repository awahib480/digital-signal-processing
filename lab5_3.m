[bday, f] = audioread('birthday.wav');
sound(bday, f);

bday_neg = -bday;  %same
sound(bday_neg, f);

bday_rev = flipud(bday);  %reversed (incomprehensible)
sound(bday_rev, f);

bday_10 = 10 * bday;  %very high
sound(bday_10, f);

bday_sqrt = sign(bday).*sqrt(abs(bday)); %distorted
sound(bday_sqrt, f);

bday_square = bday.^2;  %very low
sound(bday_square, f);