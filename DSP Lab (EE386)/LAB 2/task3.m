[track,Fs]=wavread("data/Track001.wav");

wavwrite(track,Fs,'output/task3_org.wav');

track_1_2=track(1:2:end);
wavwrite(track_1_2,Fs/2,'output/task3_half.wav');

track_1_3=track(1:3:end);
wavwrite(track_1_3,Fs/3,'output/task3_athird.wav');

track_1_6=track(1:6:end);
wavwrite(track_1_6,Fs/6,'output/task3_onesixth.wav');