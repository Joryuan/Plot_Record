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
    PhoHandleCell{1}(Cnt).Units = 'centimeter';          % 设置figure图窗测量单位 — centimeter 厘米
    PhoHandleCell{1}(Cnt).Position = [10 10 7.5 5.0];    % 设置figure对象的位置及大小
end
for Cnt = 1:numel(PhoHandleCell{2})
    PhoHandleCell{2}(Cnt).LineWidth = 1;               % 设置网格线、坐标区轮廓和刻度线的线条宽度
    PhoHandleCell{2}(Cnt).FontSize = fontsize;         % 设置坐标轴字体大小
    PhoHandleCell{2}(Cnt).FontName = fontname;         % 设置坐标轴字型
    
    PhoHandleCell{2}(Cnt).GridLineStyle = '--';        % 主网格线线性
    PhoHandleCell{2}(Cnt).GridColor = 'black';         % 主网格线颜色
    PhoHandleCell{2}(Cnt).GridAlpha = 0.5;             % 主网格线透明度 范围[0 1], 1不透明，0透明
    PhoHandleCell{2}(Cnt).MinorGridLineStyle = '--';   % 次网格线线性
    PhoHandleCell{2}(Cnt).MinorGridColor = 'black';    % 次网格线颜色
    PhoHandleCell{2}(Cnt).MinorGridAlpha = 0.5;        % 次网格线的透明度 范围[0 1],1不透明，0透明
    
    PhoHandleCell{2}(Cnt).Layer = 'bottom';            % 网格线相对于绘图数据的位置 'bottom'-在图形对象下方显示刻度线和网格线 'top'-在图形对象上方显示刻度线和网格线
    
    PhoHandleCell{2}(Cnt).XGrid = 'on';                % 打开X轴主网格线
    PhoHandleCell{2}(Cnt).YGrid = 'on';                % 打开Y轴网格线
    PhoHandleCell{2}(Cnt).XMinorGrid = 'off';          % 打开X轴主网格线
    PhoHandleCell{2}(Cnt).YMinorGrid = 'off';          % 打开Y轴主网格线
    
    PhoHandleCell{2}(Cnt).XLabel.FontSize = fontsize;  % X轴字体大小设定    
    PhoHandleCell{2}(Cnt).YLabel.FontSize = fontsize;  % Y轴字体大小设定
    PhoHandleCell{2}(Cnt).XLabel.Interpreter = 'LaTex';% X轴字体解释器为Latex
    PhoHandleCell{2}(Cnt).YLabel.Interpreter = 'LaTex';% Y轴字体解释器为Latex
    % PhoHandleCell{2}(1,1).YLabel.Position(1) = -0.08;  % 设置Y轴标题横轴位置
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
PhoHandleCell{2}(1,1).XLim = [0.0 1.0];        % 设定x轴坐标范围
PhoHandleCell{2}(1,1).XTick = (0.0:0.2:1.0);   % 改变X轴坐标轴间隔显示
PhoHandleCell{2}(1,1).XTickLabel = [];         % 关闭X轴坐标轴显示
PhoHandleCell{2}(1,1).YLim = [-8 8];           % 设定Y轴坐标范围
PhoHandleCell{2}(1,1).YTick = (-8:8:8);        % 改变Y轴坐标轴间隔显示
PhoHandleCell{2}(1,1).YAxis.Exponent = 0;      % 以指数形式显示坐标轴标度并设定坐标轴指数值
PhoHandleCell{2}(1,1).YAxisLocation = 'left'; % 设定Y轴坐标轴显示位置 'right' 'left'
PhoHandleCell{2}(1,1).XLabel.String = '$\textbf{Time[sec]}$';     % X轴标题
PhoHandleCell{2}(1,1).XLabel.Visible = 'off';                     % X轴可视化
PhoHandleCell{2}(1,1).YLabel.String = '$\theta/rad$';             % Y轴标题
% 设置图例 ---------------------------------------------
lgd = legend(PhoHandleCell{2}(1,1));
lgd.Box = 'off';                     % 关闭图例白色背景
lgd.NumColumns = 1;                  % 设置显示的图例的列数
lgd.Orientation = 'horizontal';      % 设置图例显示取向
lgd.Location = 'northeast';          % 设置图例位置
lgd.Title.FontSize = fontsize;       % 设置图例标题字体大小
lgd.FontSize = fontsize;             % 设置图例字体大小
lgd.Interpreter = 'LaTex';           % 设置图例解释器为LaTex
lgd.String = {'$\rm{PosStepRef}$','$\rm{PosRef}$','$\rm{PosReal}$'}; % 添加图例名称
clear lgd;                           % 删除图例句柄

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
% % 设置子图及辅助定位矩形框 -----------------------------------------------------
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
PhoHandleCell{2}(1,3).XTick = (0.0:0.2:1); % 改变X轴坐标轴间隔显示
PhoHandleCell{2}(1,3).YLim = [-0.05 0.05];
PhoHandleCell{2}(1,3).YTick = (-0.05:0.05:0.05);    % 改变Y轴坐标轴间隔显示

PhoHandleCell{2}(1,3).XLabel.Interpreter = 'LaTex';% X轴字体编辑模式为latex模式
PhoHandleCell{2}(1,3).XLabel.String = '$t/s$';
PhoHandleCell{2}(1,3).XLabel.Visible = 'on';
PhoHandleCell{2}(1,3).YLabel.Interpreter = 'LaTex';% Y轴字体编辑模式为latex模式
PhoHandleCell{2}(1,3).YLabel.String = '$\theta_{err}/rad$';
PhoHandleCell{2}(1,3).YLabel.Visible = 'on';



% Figure 2 -subplot 1 ==========================================================
% ………………
% ………………



% Figure 2 -subplot 2 ==========================================================
% ………………
% ………………



% --------------
% End of file
% --------------