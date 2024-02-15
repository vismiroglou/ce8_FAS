t_sec = measurementData.ImpulseResponse(1,1).Time;
ir = measurementData.ImpulseResponse(1,1).Amplitude;
f_Hz = measurementData.MagnitudeResponse(1,1).Frequency;
IRdB = measurementData.MagnitudeResponse(1,1).MagnitudeDB;
tl = tiledlayout(f,2,1);
recChMap = 1;
title(tl,"Impulse Response Measurement")
ax1 = plotTile(tl,t_sec,ir,[1 1],"linear","Impulse Response","Amplitude","Time (s)");
plotTile(tl,f_Hz,IRdB,[1 1],"log","Magnitude Response","Magnitude (dB)","Frequency (Hz)");
leg = legend(ax1,compose("Ch. %d",recChMap),Orientation="horizontal");
leg.Layout.Tile = "south";


function ax = plotTile(tile,x,y,tilespan,xScale,titlelbl,ylbl,xlbl)
ax = nexttile(tile,tilespan);
plot(ax,x,y)
title(ax,titlelbl)
ylabel(ax,ylbl)
xlabel(ax,xlbl)
ymin = min(y,[],"all");
ymax = max(y,[],"all");
yspan = ymax - ymin;
ax.YLim = [ymin-.1*yspan ymax+.1*yspan];
if strcmp(xScale,"log")
    ax.XLim = [x(find(x>0,1)) x(end)];
    ax.XScale = "log";
else
    ax.XLim = [0 x(end)];
end
grid(ax,"on")
end