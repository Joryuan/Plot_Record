%% =========================================
% File Name:    Plot Template Version 2
% Description:  None
% Author:       Zhu Shuaiyuan
% Release Data: Fri Feb.10 2023
% History:      1.Data:     Author:
%               Modification:
%               2.Data:     Author:
%               Modification:
% ==============================================
%% �½����ڲ����ô�������
%������һ��figureͼ�����󣬸���ΪScreen
fig1 = figure(1);
fig1.Units = 'inches';%����ͼ���Ĳ�����λ
fig1.Position = [0 0 1000 800];%����ͼ���Ĵ�С��λ�ã�ǰ��������Ϊ����ڸ�������꣬����������Ϊfigure1����Ĵ�С
fig1.Color = 'r';%����ͼ���ı���ɫ
%�����ڶ���figureͼ�����󣬸���ΪScreen
fig2 = figure(2);
fig2.Units = 'inches';
fig2.Position = [0 0 1000 800];%����ͼ���Ĵ�С��λ�ã�ǰ��������Ϊ����ڸ�������꣬����������Ϊfigure2����Ĵ�С
fig2.Color = 'g';%����ͼ���ı���ɫ

%�������
fontsize = 14;
fontname = 'Times New Roman';

%% ����ʾ��
%����ǰͼ������Ϊfig1
figure(fig1);

% %% x������Ľ���
A = linspace(0,0.02,100);

plot(A,sin(100*pi*A),'linewidth',2);
ax1 = fig1.CurrentAxes; %ͨ��fig.CurrentAxes��ȡ��ǰͼ���е�axes��������������� Axes�ĸ���Ϊfigure
% ax = gca; %ͨ��gca��ȡ��ǰ��axesͼ�������������ã�Ŀǰδ��ȫŪ����

ax1.LineWidth = 1;%���������ߡ��������������Ϳ̶��ߵ��������
ax1.FontSize = fontsize;%���������������С
ax1.FontName = fontname;%��������������

ax1.XLim = [0 0.02];
ax1.XTick = (0:0.005:0.02);%�ı�X������������ʾ
ax1.YLim = [-1 1];
ax1.YTick = (-1:0.5:1);%�ı�Y������������ʾ

ax1.GridLineStyle = '--';%������������
ax1.GridColor = 'black';%����������ɫ
ax1.MinorGridLineStyle = '--';%����������ɫ
ax1.MinorGridColor = 'black';%����������ɫ

ax1.GridAlpha = 0.5;%�������ߵ�͸���� ��Χ[0 1],1��͸����0͸��
ax1.MinorGridAlpha = 0.5;%�������ߵ�͸���� ��Χ[0 1],1��͸����0͸��

ax1.Layer = 'bottom';%����������ڻ�ͼ���ݵ�λ�� 'bottom'-��ͼ�ζ����·���ʾ�̶��ߺ������� 'top'-��ͼ�ζ����Ϸ���ʾ�̶��ߺ�������

ax1.XGrid = 'on';%ÿ�������᷽����������ߵ���ʾ��ʽ
ax1.YGrid = 'on';
ax1.XMinorGrid = 'off';%ÿ�������᷽��Ĵ������ߵ���ʾ��ʽ
ax1.YMinorGrid = 'off';

%ͼ������
legend();% ͼ�������ñ���Ҫ�ȴ���ͼ������,�����������ã�����matlab�Ѿ�Ĭ�ϴ����ĸ�����
ax1.Legend.Interpreter = 'LaTex';%����Latex�༭ģʽ
ax1.Title.FontSize = fontsize;
ax1.Legend.String = {'$Fr_{cmd}$','$Fr$'};
% ����������
% �ܱ���
% ax1.Title.Interpreter = 'LaTex';
% ax1.Title.FontSize = fontsize;
% ax1.Title.String = '$Speed\,\,Curve$';
% X�����
ax1.XLabel.Interpreter = 'LaTex';
ax1.XLabel.FontSize = fontsize;
% ax1.XLabel.String = '$\textrm{Time/s}$'; %��������
ax1.XLabel.String = '$Time/s$';
% Y�����
ax1.YLabel.Interpreter = 'LaTex';
ax1.YLabel.FontSize = fontsize;
ax1.YLabel.String = '$Fre/Hz$';

% ������ͼ
suba1 = axes(fig1,'Position',[0.25,0.34,0.35,0.08]);
plot(ScopeData1.time,ScopeData1.signals(1).values(:,2) - ScopeData1.signals(1).values(:,1),'linewidth',2);
suba1.FontSize = 10;
suba1.FontName = fontname; 
suba1.XLim = [0.040,0.050];
suba1.XTick = (0.040:0.002:0.050);
suba1.YLim = [-0.0050,0.0050];
grid on;

suba2 = axes(fig1,'Position',[0.38,0.15,0.50,0.08]); 
plot(ScopeData1.time,ScopeData1.signals(1).values(:,2) - ScopeData1.signals(1).values(:,1),'linewidth',2);
suba2.FontSize = 10;
suba2.FontName = fontname; 
suba2.XLim = [0.0557,0.0667];
suba2.XTick = (0.0557:0.002:0.0667);
suba2.YLim = [-0.005,0.005];
grid on;

% ���Ƹ������ο�
rect1 = rectangle(ax1);
rect1.Position = [0.041 -0.005 0.009 0.01];
rect1.LineStyle = '--';
rect1.LineWidth = 1.0;
rect1.EdgeColor = "r";

rect2 = rectangle(ax1);
rect2.Position = [0.058 -0.005 0.009 0.01];
rect2.LineStyle = '--';
rect2.LineWidth = 1.0;
rect2.EdgeColor = "r";

%% �����������ϻ�ͼ
%����ǰͼ������Ϊfig1
figure(fig1);
%��ͼ1
subpot(2,1,1);
plot(ScopeData.time,ScopeData.signals(2).values(:,2),'linewidth',1);
hold on;
plot(ScopeData.time,ScopeData.signals(2).values(:,1),'linewidth',1);

ax1 = fig1.CurrentAxes; %ͨ��fig.CurrentAxes��ȡ��ǰͼ���е�axes��������������� Axes�ĸ���Ϊfigure
% ����������
% -----------
% 

%������������⼰ͼ�α���
% -----------
% 

%��ͼ2
subplot(2,2,2);
plot(ScopeData.time,ScopeData.signals(2).values(:,2),'linewidth',1);
hold on;
plot(ScopeData.time,ScopeData.signals(2).values(:,1),'linewidth',1);

ax2 = fig1.CurrentAxes; %ͨ��fig.CurrentAxes��ȡ��ǰͼ���е�axes��������������� Axes�ĸ���Ϊfigure
% ����������
% -----------
% 

%������������⼰ͼ�α���
%------------
%

%����ǰͼ������Ϊfig2
figure(fig2);
plot(ScopeData.time,ScopeData.signals(2).values(:,2),'linewidth',1);

ax1 = fig2.CurrentAxes; %ͨ��fig.CurrentAxes��ȡ��ǰͼ���е�axes��������������� Axes�ĸ���Ϊfigure
% ����������
% -----------
% 

%������������⼰ͼ�α���
% -----------
% 
