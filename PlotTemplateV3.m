%% =========================================
% File Name:    Plot Template Version 3
% Description:  None
% Author:       Zhu Shuaiyuan
% Release Data: Sun Feb.12 2023
% History:      1.Data:2023.2.12  Author:Zhu Shuaiyuan
%               Modification: Using circulate to accelerate plot process
%               2.Data:     Author:
%               Modification:
% ==============================================
%% ��ͼ�����趨ֵ
FigNum = 2;           % Figure Number
SubAxesRowNum = 2;    % Axes Row Number
SubAxesColumnNum = 1; % Axes Column Number

fontsize = 14;
fontname = 'Times New Roman';
%% Building Photo Handle Cell
% Figure Array
for FigCnt = 1:FigNum
    FigHandleArr(FigCnt) = figure(FigCnt);
end
% Axes Array
SubAxesNum = SubAxesRowNum * SubAxesColumnNum;
for FigCnt = 1:FigNum
    figure(FigHandleArr(FigCnt))
    for AxesCnt = 1:SubAxesNum
        AxesHandleArr(FigCnt, AxesCnt) = subplot(SubAxesRowNum,SubAxesColumnNum,AxesCnt);
    end
end
% Handle Cell
PhoHandleCell = {FigHandleArr,AxesHandleArr};
% Free Variable Memory
clear FigNum SubAxesRowNum SubAxesColumnNum SubAxesNum;
clear FigCnt AxesCnt;
clear FigHandleArr AxesHandleArr;
%% User Defination Axes Parameters
% Figure 1 - subplot 1 ==========================================================
plot(PhoHandleCell{2}(1,1),ScopeData1.time,ScopeData1.signals(1).values(:,2),'linewidth',2,'Color','r');
hold(PhoHandleCell{2}(1,1),'on');
plot(PhoHandleCell{2}(1,1),ScopeData1.time,ScopeData1.signals(1).values(:,1),'linewidth',2,'Color','r','linestyle','--');
hold(PhoHandleCell{2}(1,1),'on');
plot(PhoHandleCell{2}(1,1),ScopeData1.time,ScopeData1.signals(1).values(:,3),'linewidth',2,'Color','b');

PhoHandleCell{2}(1,1).XLim = [0.03335 0.0667];
PhoHandleCell{2}(1,1).XTick = (0.03335:0.01:0.0667); % �ı�X������������ʾ
PhoHandleCell{2}(1,1).YLim = [-8 8];
PhoHandleCell{2}(1,1).YTick = (-8:4:8);              % �ı�Y������������ʾ

PhoHandleCell{2}(1,1).XLabel.Interpreter = 'LaTex';% X������༭ģʽΪlatexģʽ
PhoHandleCell{2}(1,1).XLabel.String = '$\textbf{Time[sec]}$';     % X�����
PhoHandleCell{2}(1,1).YLabel.Interpreter = 'LaTex';% Y������༭ģʽΪlatexģʽ
PhoHandleCell{2}(1,1).YLabel.String = '$\textbf{Position[deg]}$'; % Y�����
% ����ͼ�� ---------------------------------------------
lgd = legend(PhoHandleCell{2}(1,1));
lgd.Interpreter = 'LaTex';
lgd.Title.FontSize = fontsize;
lgd.String = {'$\rm{PosStepRef}$','$\rm{PosRef}$','$\rm{PosReal}$'};

clear lgd;
% Figure 1 -subplot 2 ==========================================================
plot(PhoHandleCell{2}(1,2),ScopeData1.time,ScopeData1.signals(1).values(:,3) - ScopeData1.signals(1).values(:,2),'linewidth',2);

PhoHandleCell{2}(1,2).XLim = [0.0333 0.0666];
PhoHandleCell{2}(1,2).XTick = (0.03333:0.01:0.0667); % �ı�X������������ʾ
PhoHandleCell{2}(1,2).YLim = [-0.05 0.05];
PhoHandleCell{2}(1,2).YTick = (-0.05:0.025:0.05);    % �ı�Y������������ʾ

PhoHandleCell{2}(1,2).XLabel.Interpreter = 'LaTex';% X������༭ģʽΪlatexģʽ
PhoHandleCell{2}(1,2).XLabel.String = '$\textbf{Time[sec]}$';
PhoHandleCell{2}(1,2).YLabel.Interpreter = 'LaTex';% Y������༭ģʽΪlatexģʽ
PhoHandleCell{2}(1,2).YLabel.String = '$\textbf{PosErr[deg]}$';
% ������ͼ -----------------------------------------------------
subpho1 = axes(PhoHandleCell{1}(1),'Position',[0.25,0.34,0.35,0.08]); 
plot(subpho1,ScopeData1.time,ScopeData1.signals(1).values(:,2) - ScopeData1.signals(1).values(:,1),'linewidth',2);
subpho1.FontSize = 10;
subpho1.FontName = fontname; 
subpho1.XLim = [0.040,0.050];
subpho1.XTick = (0.040:0.002:0.050);
subpho1.YLim = [-0.0050,0.0050];
grid on;

subpho2 = axes(PhoHandleCell{1}(1),'Position',[0.38,0.15,0.50,0.08]); 
plot(subpho2,ScopeData1.time,ScopeData1.signals(1).values(:,2) - ScopeData1.signals(1).values(:,1),'linewidth',2);
subpho2.FontSize = 10;
subpho2.FontName = fontname; 
subpho2.XLim = [0.0557,0.0667];
subpho2.XTick = (0.0557:0.002:0.0667);
subpho2.YLim = [-0.005,0.005];
grid on; 
% ���Ƹ������ο� -----------------------------------------------
rect1 = rectangle(PhoHandleCell{2}(1,2));
rect1.Position = [0.041 -0.005 0.009 0.01];
rect1.LineStyle = '--';
rect1.LineWidth = 1.0;
rect1.EdgeColor = "r";

rect2 = rectangle(PhoHandleCell{2}(1,2));
rect2.Position = [0.058 -0.005 0.009 0.01];
rect2.LineStyle = '--';
rect2.LineWidth = 1.0;
rect2.EdgeColor = "r";

clear subpho1 subpho2 rect1 rect2;
% Figure 2 -subplot 1 ==========================================================
% ������������
% ������������

% Figure 2 -subplot 2 ==========================================================
% ������������
% ������������
%% Loop Normalize
for Cnt = 1:length(PhoHandleCell{1})
    PhoHandleCell{1}(Cnt).Position = [0 0 500 600];    % ����figure�����λ�ü���С
    PhoHandleCell{1}(Cnt).Units = 'inches';            % ����figureͼ��������λ
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
end
clear Cnt;
% --------------
% End of file
% --------------