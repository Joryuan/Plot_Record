%% =========================================
% File Name:    Plot Template Version 4
% Description:
% Author:       Zhu Shuaiyuan
% Release Data: Jar Tue.4 2024
% History:      1.Data:2024.1.4     Author:Zhu Shuaiyuan
%               Modification:Remove subplot function and use tight_subplot function
%               2.Data:     Author:
%               Modification:
% ==============================================
%% Import Original Data
% ------------------
% ------------------


%% Plot Input Parameters Setting
FigNum = 2;           % Figure Number Setting
SubAxesRowNum = 3;    % Axes Row Number
SubAxesColumnNum = 1; % Axes Column Number
Gap = [.01 .03];      % [gap_h gap_w] normalized units (0~1)
Marg_h = [.1 .01];    % [lower upper] normalized units (0~1)
Marg_w = [.1 .01];    % [left right]  normalized units (0~1)

fontsize = 10.5;      % Setting axes fontsize
fontname = 'Times New Roman';
linewidth = 1.0;      % Setting plot line width
%% Building Photo Handle Cell and Setting Common figure and axes parameters
for FigCnt = 1:FigNum
    FigHandleArr(FigCnt) = figure(FigCnt);
    AxesHandleArr(FigCnt,:) = reshape(tight_subplot(SubAxesRowNum,SubAxesColumnNum,Gap,Marg_h,Marg_w),1,SubAxesRowNum*SubAxesColumnNum);
end
% Handle Cell
PhoHandleCell = {FigHandleArr,AxesHandleArr};
for Cnt = 1:length(PhoHandleCell{1})
    PhoHandleCell{1}(Cnt).Units = 'centimeter';          % ����figureͼ��������λ �� centimeter ����
    PhoHandleCell{1}(Cnt).Position = [10 10 7.5 5.0];    % ����figure�����λ�ü���С
end
for Cnt = 1:numel(PhoHandleCell{2})
    PhoHandleCell{2}(Cnt).LineWidth = 1;               % ���������ߡ������������Ϳ̶��ߵ��������
    PhoHandleCell{2}(Cnt).FontSize = fontsize;         % ���������������С
    PhoHandleCell{2}(Cnt).FontName = fontname;         % ��������������
    
    PhoHandleCell{2}(Cnt).GridLineStyle = '--';        % ������������
    PhoHandleCell{2}(Cnt).GridColor = 'black';         % ����������ɫ
    PhoHandleCell{2}(Cnt).GridAlpha = 0.5;             % ��������͸���� ��Χ[0 1], 1��͸����0͸��
    PhoHandleCell{2}(Cnt).MinorGridLineStyle = '--';   % ������������
    PhoHandleCell{2}(Cnt).MinorGridColor = 'black';    % ����������ɫ
    PhoHandleCell{2}(Cnt).MinorGridAlpha = 0.5;        % �������ߵ�͸���� ��Χ[0 1],1��͸����0͸��
    
    PhoHandleCell{2}(Cnt).Layer = 'bottom';            % ����������ڻ�ͼ���ݵ�λ�� 'bottom'-��ͼ�ζ����·���ʾ�̶��ߺ������� 'top'-��ͼ�ζ����Ϸ���ʾ�̶��ߺ�������
    
    PhoHandleCell{2}(Cnt).XGrid = 'on';                % ��X����������
    PhoHandleCell{2}(Cnt).YGrid = 'on';                % ��Y��������
    PhoHandleCell{2}(Cnt).XMinorGrid = 'off';          % ��X����������
    PhoHandleCell{2}(Cnt).YMinorGrid = 'off';          % ��Y����������
    
    PhoHandleCell{2}(Cnt).XLabel.FontSize = fontsize;  % X�������С�趨    
    PhoHandleCell{2}(Cnt).YLabel.FontSize = fontsize;  % Y�������С�趨
    PhoHandleCell{2}(Cnt).XLabel.Interpreter = 'LaTex';% X�����������ΪLatex
    PhoHandleCell{2}(Cnt).YLabel.Interpreter = 'LaTex';% Y�����������ΪLatex
    % PhoHandleCell{2}(1,1).YLabel.Position(1) = -0.08;  % ����Y��������λ��
end
% Free Variable Memory
clear FigNum FigCnt;
clear SubAxesRowNum SubAxesColumnNum Gap Marg_h Marg_w;
clear FigHandleArr AxesHandleArr;
clear Cnt;
%% User Defination Axes Parameters
% Figure 1 - subplot 1 ==========================================================
% plot(PhoHandleCell{2}(1,1),ScopeData1.time,ScopeData1.signals(1).values(:,2),'linewidth',2,'Color','r');
% hold(PhoHandleCell{2}(1,1),'on');
% plot(PhoHandleCell{2}(1,1),ScopeData1.time,ScopeData1.signals(1).values(:,1),'linewidth',2,'Color','r','linestyle','--');
% hold(PhoHandleCell{2}(1,1),'on');
% plot(PhoHandleCell{2}(1,1),ScopeData1.time,ScopeData1.signals(1).values(:,3),'linewidth',2,'Color','b');
PhoHandleCell{2}(1,1).XLim = [0.0 1.0];        % �趨x�����귶Χ
PhoHandleCell{2}(1,1).XTick = (0.0:0.2:1.0);   % �ı�X������������ʾ
PhoHandleCell{2}(1,1).XTickLabel = [];         % �ر�X����������ʾ
PhoHandleCell{2}(1,1).YLim = [-8 8];           % �趨Y�����귶Χ
PhoHandleCell{2}(1,1).YTick = (-8:8:8);        % �ı�Y������������ʾ
PhoHandleCell{2}(1,1).YAxis.Exponent = 0;      % ��ָ����ʽ��ʾ�������Ȳ��趨������ָ��ֵ
PhoHandleCell{2}(1,1).YAxisLocation = 'left'; % �趨Y����������ʾλ�� 'right' 'left'
PhoHandleCell{2}(1,1).XLabel.String = '$\textbf{Time[sec]}$';     % X�����
PhoHandleCell{2}(1,1).XLabel.Visible = 'off';                     % X����ӻ�
PhoHandleCell{2}(1,1).YLabel.String = '$\theta/rad$';             % Y�����
% ����ͼ�� ---------------------------------------------
lgd = legend(PhoHandleCell{2}(1,1));
lgd.Box = 'off';                     % �ر�ͼ����ɫ����
lgd.NumColumns = 1;                  % ������ʾ��ͼ��������
lgd.Orientation = 'horizontal';      % ����ͼ����ʾȡ��
lgd.Location = 'northeast';          % ����ͼ��λ��
lgd.Title.FontSize = fontsize;       % ����ͼ�����������С
lgd.FontSize = fontsize;             % ����ͼ�������С
lgd.Interpreter = 'LaTex';           % ����ͼ��������ΪLaTex
lgd.String = {'$\rm{PosStepRef}$','$\rm{PosRef}$','$\rm{PosReal}$'}; % ���ͼ������
clear lgd;                           % ɾ��ͼ�����

% Figure 1 -subplot 2 ==========================================================
% plot(PhoHandleCell{2}(1,2),ScopeData1.time,ScopeData1.signals(1).values(:,3) - ScopeData1.signals(1).values(:,2),'linewidth',2);
PhoHandleCell{2}(1,2).XLim = [0.0 1];
PhoHandleCell{2}(1,2).XTick = (0.0:0.2:1);
PhoHandleCell{2}(1,2).YLim = [-0.05 0.05];
PhoHandleCell{2}(1,2).YTick = (-0.05:0.05:0.05);
PhoHandleCell{2}(1,2).XLabel.Interpreter = 'LaTex';
PhoHandleCell{2}(1,2).XLabel.String = '$t/s$';
PhoHandleCell{2}(1,2).XLabel.Visible = 'off';
PhoHandleCell{2}(1,2).YLabel.Interpreter = 'LaTex';
PhoHandleCell{2}(1,2).YLabel.String = '$\theta_{err}/rad$';
PhoHandleCell{2}(1,2).YLabel.Visible = 'on';
% % ������ͼ��������λ���ο� -----------------------------------------------------
subpho1 = axes(PhoHandleCell{1}(1),'Position',[0.25,0.2,0.35,0.12]); 
% plot(subpho1,ScopeData1.time,ScopeData1.signals(1).values(:,2) - ScopeData1.signals(1).values(:,1),'linewidth',2);
subpho1.FontSize = 10;
subpho1.FontName = fontname; 
subpho1.XLim = [0.2,0.4];
subpho1.XTick = (0.2:0.1:0.4);
subpho1.YLim = [-0.5,0.5];
grid on;
rect1 = rectangle(PhoHandleCell{2}(1,1));
rect1.Position = [0.1 0 0.1 4.0];
rect1.LineStyle = '--';
rect1.LineWidth = 1.0;
rect1.EdgeColor = 'r';
clear subpho1 rect1;

% Figure 1 -subplot 3 ==========================================================
% plot(PhoHandleCell{2}(1,3),ScopeData1.time,ScopeData1.signals(1).values(:,3) - ScopeData1.signals(1).values(:,2),'linewidth',2);
PhoHandleCell{2}(1,3).XLim = [0.0 1];
PhoHandleCell{2}(1,3).XTick = (0.0:0.2:1); % �ı�X������������ʾ
PhoHandleCell{2}(1,3).YLim = [-0.05 0.05];
PhoHandleCell{2}(1,3).YTick = (-0.05:0.05:0.05);    % �ı�Y������������ʾ

PhoHandleCell{2}(1,3).XLabel.Interpreter = 'LaTex';% X������༭ģʽΪlatexģʽ
PhoHandleCell{2}(1,3).XLabel.String = '$t/s$';
PhoHandleCell{2}(1,3).XLabel.Visible = 'on';
PhoHandleCell{2}(1,3).YLabel.Interpreter = 'LaTex';% Y������༭ģʽΪlatexģʽ
PhoHandleCell{2}(1,3).YLabel.String = '$\theta_{err}/rad$';
PhoHandleCell{2}(1,3).YLabel.Visible = 'on';



% Figure 2 -subplot 1 ==========================================================
% ������������
% ������������



% Figure 2 -subplot 2 ==========================================================
% ������������
% ������������



% --------------
% End of file
% --------------