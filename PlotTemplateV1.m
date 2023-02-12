%% =========================================
% File Name:    Plot Template Version 1
% Description:  None
% Author:       Zhu Shuaiyuan
% Release Data: Mon Mar.7 2022
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
