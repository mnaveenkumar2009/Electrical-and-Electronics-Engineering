[track,Fs]=wavread("data/Track001.wav");
wavwrite(track,Fs,'naveen.wav');

Conv1=load('data/ConvFile1.txt');
Conv2=load('data/ConvFile2.txt');

track1=conv(Conv1,track);
wavwrite(track1,Fs,'naveen1.wav')

track2=conv(Conv2,track);
wavwrite(track2,Fs,'naveen2.wav')
