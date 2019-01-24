[track,Fs]=wavread("data/Track001.wav");
wavwrite(track,Fs,'task3_org.wav');
track_half=track(1:2:end);
wavwrite(track_half,Fs/2,'task3_half.wav');
track_onethird=track(1:3:end);
wavwrite(track_onethird,Fs/3,'task3_athird.wav');
