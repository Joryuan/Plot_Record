%% 新建窗口并设置窗口属性
%创建第一个figure图窗对象，父类为Screen
fig1 = figure(1);
fig1.Units = 'inches';%设置图窗的测量单位
fig1.Position = [0 0 1000 800];%设置图窗的大小及位置，前两个参数为相对于父类的坐标，后两个参数为figure1对象的大小
fig1.Color = 'r';%设置图窗的背景色
%创建第二个figure图窗对象，父类为Screen
fig2 = figure(2);
fig2.Units = 'inches';
fig2.Position = [0 0 1000 800];%设置图窗的大小及位置，前两个参数为相对于父类的坐标，后两个参数为figure2对象的大小
fig2.Color = 'g';%设置图窗的背景色

%定义变量
fontsize = 14;
fontname = 'Times New Roman';

%% 参数示例
%将当前图窗设置为fig1
figure(fig1);

% %% x轴变量的建立
A = linspace(0,0.02,100);

plot(A,sin(100*pi*A),'linewidth',2);
ax1 = fig1.CurrentAxes; %通过fig.CurrentAxes获取当前图窗中的axes对象进行属性设置 Axes的父类为figure
% ax = gca; %通过gca获取当前的axes图窗进行属性设置，目前未完全弄明白

ax1.LineWidth = 1;%设置网格线、坐标区框轮廓和刻度线的线条宽度
ax1.FontSize = fontsize;%设置坐标轴字体大小
ax1.FontName = fontname;%设置坐标轴字型

ax1.XLim = [0 0.02];
ax1.XTick = (0:0.005:0.02);%改变X轴坐标轴间隔显示
ax1.YLim = [-1 1];
ax1.YTick = (-1:0.5:1);%改变Y轴坐标轴间隔显示

ax1.GridLineStyle = '--';%主网格线线性
ax1.GridColor = 'black';%主网格线颜色
ax1.MinorGridLineStyle = '--';%次网格线颜色
ax1.MinorGridColor = 'black';%次网格线颜色

ax1.GridAlpha = 0.5;%主网格线的透明度 范围[0 1],1不透明，0透明
ax1.MinorGridAlpha = 0.5;%次网格线的透明度 范围[0 1],1不透明，0透明

ax1.Layer = 'bottom';%网格线相对于绘图数据的位置 'bottom'-在图形对象下方显示刻度线和网格线 'top'-在图形对象上方显示刻度线和网格线

ax1.XGrid = 'on';%每个坐标轴方向的主网格线的显示方式
ax1.YGrid = 'on';
ax1.XMinorGrid = 'off';%每个坐标轴方向的次网格线的显示方式
ax1.YMinorGrid = 'off';

%图例设置
legend();% 图例的设置必须要先创建图例属性,标题设置则不用，可能matlab已经默认创建的该属性
ax1.Legend.Interpreter = 'LaTex';%采用Latex编辑模式
ax1.Title.FontSize = fontsize;
ax1.Legend.String = {'$Fr_{cmd}$','$Fr$'};
% 坐标轴设置
% 总标题
% ax1.Title.Interpreter = 'LaTex';
% ax1.Title.FontSize = fontsize;
% ax1.Title.String = '$Speed\,\,Curve$';
% X轴标题
ax1.XLabel.Interpreter = 'LaTex';
ax1.XLabel.FontSize = fontsize;
% ax1.XLabel.String = '$\textrm{Time/s}$'; %字体设置
ax1.XLabel.String = '$Time/s$';
% Y轴标题
ax1.YLabel.Interpreter = 'LaTex';
ax1.YLabel.FontSize = fontsize;
ax1.YLabel.String = '$Fre/Hz$';


%% 在所建窗口上绘图
%将当前图窗设置为fig1
figure(fig1);
%子图1
subpot(2,1,1);
plot(ScopeData.time,ScopeData.signals(2).values(:,2),'linewidth',1);
hold on;
plot(ScopeData.time,ScopeData.signals(2).values(:,1),'linewidth',1);

ax1 = fig1.CurrentAxes; %通过fig.CurrentAxes获取当前图窗中的axes对象进行属性设置 Axes的父类为figure
% 属性设置区
% -----------
% 

%设置坐标轴标题及图形标题
% -----------
% 

%子图2
subplot(2,2,2);
plot(ScopeData.time,ScopeData.signals(2).values(:,2),'linewidth',1);
hold on;
plot(ScopeData.time,ScopeData.signals(2).values(:,1),'linewidth',1);

ax2 = fig1.CurrentAxes; %通过fig.CurrentAxes获取当前图窗中的axes对象进行属性设置 Axes的父类为figure
% 属性设置区
% -----------
% 

%设置坐标轴标题及图形标题
%------------
%

%将当前图窗设置为fig2
figure(fig2);
plot(ScopeData.time,ScopeData.signals(2).values(:,2),'linewidth',1);

ax1 = fig2.CurrentAxes; %通过fig.CurrentAxes获取当前图窗中的axes对象进行属性设置 Axes的父类为figure
% 属性设置区
% -----------
% 

%设置坐标轴标题及图形标题
% -----------
% 
