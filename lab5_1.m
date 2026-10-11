[we, f] = audioread('we.m4a');
sound(we, f);
we_reverse = flipud(we);
sound(we_reverse, f);

[you, f] = audioread('you.m4a');
sound(you, f);
you_reverse = flipud(you);
sound(you_reverse, f);

[we_you, f] = audioread('we are you.m4a');
sound(we_you, f);
we_you_reverse = flipud(we_you);
sound(we_you_reverse, f);
