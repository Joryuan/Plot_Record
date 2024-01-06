# 0 综述

Matlab的图形系统是面向对象的，图形对象之间的关系为父代与子代的关系，具体关系如下图所示：

![img](https://pic1.zhimg.com/80/v2-e3a76c39ed149429a156d6a14396b780_720w.webp)

每个图形对象都拥有自己的句柄（handle）。所有能创建图形对象的matlab函数都可给出所创建图形对象的句柄。

- 根（root）：只有一个，对应计算机屏幕，其句柄为0。其他图形对象都是root的子对象；
- 图形窗口（figure）：数目不限，句柄为正整数。除根之外，其它对象都是figure的子对象；
- 其他图形对象（如坐标轴axes）：句柄为浮点数；



句柄属性的设置与修改：

- get — 获得句柄图像对象的属性和返回某些对象的句柄值
- set — 改变图像对象的属性
- delete(h) — 删除句柄为h的图形对象

专用函数：

- gcf — 返回当前窗口对象的句柄 Get Current Figure

- gca — 返回当前轴对象的句柄 Get Current Axes

- gco — 返回当前图形对象的句柄 Get Current Object

若一个对象的句柄已知，可以获得其“父”或者“子“句柄：

``` matlab
f = get(h, 'parent');
I = get(h, 'children')
```

# 1 figure（创建图窗窗口）

## 语法及说明

```matlab
figure;             % 使用默认属性值创建一个新的图窗窗口。生成的图窗为当前图窗
figure(Name, Value); % 使用一个或多个名称-值对组参数修改图窗属性。例如，figure('Color','white')将背景色设置为白色
f = figure(___);    % 返回Figure对象。可使用f在创建图窗后查询或修改其属性。
f = figure(1);      % 创建一个Number属性为1的图窗，f为所创建图窗的句柄，1为编号。

figure(f);          % 将f指定的图窗作为当前图窗，并将其显示在其他所有图窗的上面。
figure(n)           % 查找Number属性等于n的图窗，并将其作为当前图窗。
                    % 如果不存在具有该属性的图窗，MALTAB将创建一个新图窗并将其Number属性设置为n。
```

参考链接：<https://ww2.mathworks.cn/help/matlab/ref/figure.html?s_tid=doc_ta>

# 2 axes（创建笛卡尔坐标区）

## 语法及说明

``` matlab
axes;                      % 在当前图窗中创建默认的笛卡尔坐标区，并将其设置为当前坐标区。通常情况下，您不需要在绘图之前创建坐标区，因为如果不存在坐标区，图形函数会在绘图时自动创建坐标区。
axes(Name, Value);         % 使用一个或多个名称-值对组参数修改坐标区外观，或控制数据的显示方式。例如，'FontSize',14可设置坐标区文本字体大小。
axes(parent, Name, Value); % 在有parent指定的图窗、面板或者选项卡中创建坐标区，而不是在当前图窗中创建
ax = axes(___);            % 返回创建的Axes对象。可在创建Axes对象后使用ax查询和修改对象属性。

axes(ax);                  % 将ax指定的axes作为当前坐标区，此操作将使该坐标区现实在最前边，并使其成为后续图形函数的目标。
axes(cax);                 % 将父图窗的 CurrentAxes 属性设置为 cax。如果父图窗的 HandleVisibilty 属性设置为 "on"，则 cax 将成为当前坐标区。此命令还将 cax 设置为父对象的 Children 属性中列出的第一个对象。父对象通常是一个图窗或一个分块图布局。
```

参考链接："https://ww2.mathworks.cn/help/matlab/ref/axes.html?s_tid=doc_ta"

关于Axes的属性，参阅："https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.axis.axes-properties.html"

# 3 subplot（在各个分块位置创建坐标区）

## 语法及说明

``` matlab
subplot(m, n, p);            % 将当前图窗划分为 m×n 网格，并在 p 指定的位置创建坐标区。MATLAB® 按行号对子图位置进行编号。第一个子图是第一行的第一列，第二个子图是第一行的第二列，依此类推。如果指定的位置已存在坐标区，则此命令会将该坐标区设为当前坐标区。
subplot(m, n, p, 'replace'); % 删除位置 p 处的现有坐标区并创建新坐标区。
subplot(m, n, p, 'align');   % 创建新坐标区，以便对齐图框。此选项为默认行为。
subplot(m, n, p, ax);        % 将现有坐标区 ax 转换为同一图窗中的子图。

subplot('Position', pos);    % 在 pos 指定的自定义位置创建坐标区。使用此选项可定位未与网格位置对齐的子图。指定 pos 作为 [left bottom width height] 形式的四元素向量。如果新坐标区与现有坐标区重叠，新坐标区将替换现有坐标区。

subplot(___,Name,Value);
ax = subplot(___);           % subplot(___) 创建一个 Axes 对象、PolarAxes 对象或 GeographicAxes 对象。以后可以使用 ax 修改坐标区。

subplot(ax);                  % 将ax指定的坐标区设为父图窗的当前坐标区。如果父图窗尚不是当前图窗，此选项不会使父图窗成为当前图窗。
```

参考链接："https://ww2.mathworks.cn/help/matlab/ref/subplot.html?s_tid=doc_ta"

## 非常规用法及示例

### 大小不同的子图

创建一个包含三个子图的图窗。在图窗的上半部分创建两个子图，并在图窗的下半部分创建第三个子图。在每个子图上添加标题。

``` matlab
subplot(2,2,1);
x = linspace(-3.8,3.8);
y_cos = cos(x);
plot(x,y_cos);
title('Subplot 1: Cosine')

subplot(2,2,2);
y_poly = 1 - x.^2./2 + x.^4./24;
plot(x,y_poly,'g');
title('Subplot 2: Polynomial')

subplot(2,2,[3,4]);
plot(x,y_cos,'b',x,y_poly,'g');
title('Subplot 3 and 4: Both')
```

## rectangle(创建带有尖角或圆角的矩形)

### 语法及说明

``` matlab
rectangle('position',pos);                 % 在二维坐标中创建一个矩形将 pos 指定为 [x y w h] 形式的四元素向量（以数据单位表示）。x 和 y 元素确定位置，w 和 h 元素确定大小。函数在当前坐标区中绘制图形，而不清除坐标区中的现有内容。
rectangle('position',pos,'Curvature',cur); % 为矩形的边添加曲率。要沿水平边和垂直边使用不同的曲率，请将 cur 指定为 [horizontal vertical] 形式的二元素向量。要沿所有边使用相同的曲率，请将 cur 指定为一个标量值。请将值指定为 0（无曲率）和 1（最大曲率）之间的值。使用 [1 1] 创建一个椭圆形或圆形。
rectangle(___,Name,Value);                 % 使用一个或多个名称-值对组参数指定矩形的属性。例如，'FaceColor','red' 指定红色填充颜色。您可以使用上述语法中的任意输入参数组合指定矩形的属性。
rectangle(ax,___);                         % 将在由 ax 指定的坐标区中，而不是在当前坐标区 (gca) 中创建矩形。选项 ax 可以位于前面的语法中的任何输入参数组合之前。
r = rectangle(___);                        % 返回矩形对象。在创建矩形后，可以使用 r 修改其属性。有关属性列表，请参阅 Rectangle 属性。可以使用任意上述语法返回一个输出参数。
```

参考链接：“https://ww2.mathworks.cn/help/matlab/ref/rectangle.html?searchHighlight=rectangle&s_tid=srchtitle_rectangle_1”

# 4 plot(二维曲线)



参考链接：“https://ww2.mathworks.cn/help/matlab/ref/plot.html?searchHighlight=plot&s_tid=srchtitle_plot_1”

# 5 legend（在坐标区上添加图例）



参考链接：“https://ww2.mathworks.cn/help/matlab/ref/legend.html?s_tid=doc_ta”

关于legend的属性，参阅：“https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.illustration.legend-properties.html”



# 6 hold(添加新绘图时保留当前绘图)

参考链接：“https://ww2.mathworks.cn/help/matlab/ref/hold.html?s_tid=doc_ta”





# 7 绘图代码编写思路

创建cell对象haxes 循环赋值所有的subplot句柄 此时haxes包含所有的subplot句柄

length获取haxes长度，循环更改相同的值，如坐标轴字体大小等属性；

# 8 一些用到的函数

`findobj`

`get`

`set`



# 8 参数说明



## Line Color

| 颜色名称    | 短名称 | RGB 三元组 | 十六进制颜色代码 | 外观                                                         |
| :---------- | :----- | :--------- | :--------------- | :----------------------------------------------------------- |
| `'red'`     | `'r'`  | `[1 0 0]`  | `'#FF0000'`      | ![Sample of the color red](https://ww2.mathworks.cn/help/matlab/ref/hg_red.png) |
| `'green'`   | `'g'`  | `[0 1 0]`  | `'#00FF00'`      | ![Sample of the color green](https://ww2.mathworks.cn/help/matlab/ref/hg_green.png) |
| `'blue'`    | `'b'`  | `[0 0 1]`  | `'#0000FF'`      | ![Sample of the color blue](https://ww2.mathworks.cn/help/matlab/ref/hg_blue.png) |
| `'cyan'`    | `'c'`  | `[0 1 1]`  | `'#00FFFF'`      | ![Sample of the color cyan](https://ww2.mathworks.cn/help/matlab/ref/hg_cyan.png) |
| `'magenta'` | `'m'`  | `[1 0 1]`  | `'#FF00FF'`      | ![Sample of the color magenta](https://ww2.mathworks.cn/help/matlab/ref/hg_magenta.png) |
| `'yellow'`  | `'y'`  | `[1 1 0]`  | `'#FFFF00'`      | ![Sample of the color yellow](https://ww2.mathworks.cn/help/matlab/ref/hg_yellow.png) |
| `'black'`   | `'k'`  | `[0 0 0]`  | `'#000000'`      | ![Sample of the color black](https://ww2.mathworks.cn/help/matlab/ref/hg_black.png) |
| `'white'`   | `'w'`  | `[1 1 1]`  | `'#FFFFFF'`      | ![Sample of the color white](https://ww2.mathworks.cn/help/matlab/ref/hg_white.png) |
| `'none'`    | 不适用 | 不适用     | 不适用           | 无颜色                                                       |

## LineStyle

| 线型     | 说明   | 表示的线条                                                   |
| :------- | :----- | :----------------------------------------------------------- |
| `'-'`    | 实线   | ![Sample of solid line](https://ww2.mathworks.cn/help/matlab/ref/linestyle_solid.png) |
| `'--'`   | 虚线   | ![Sample of dashed line](https://ww2.mathworks.cn/help/matlab/ref/linestyle_dashed.png) |
| `':'`    | 点线   | ![Sample of dotted line](https://ww2.mathworks.cn/help/matlab/ref/linestyle_dotted.png) |
| `'-.'`   | 点划线 | ![Sample of dash-dotted line, with alternating dashes and dots](https://ww2.mathworks.cn/help/matlab/ref/linestyle_dashdotted.png) |
| `'none'` | 无线条 | 无线条                                                       |

## Marker

| 标记     | 说明     | 生成的标记                                                   |
| :------- | :------- | :----------------------------------------------------------- |
| `'o'`    | 圆圈     | ![Sample of circle marker](https://ww2.mathworks.cn/help/matlab/ref/marker_o.png) |
| `'+'`    | 加号     | ![Sample of plus sign marker](https://ww2.mathworks.cn/help/matlab/ref/marker_plus.png) |
| `'*'`    | 星号     | ![Sample of asterisk marker](https://ww2.mathworks.cn/help/matlab/ref/marker_asterisk.png) |
| `'.'`    | 点       | ![Sample of point marker](https://ww2.mathworks.cn/help/matlab/ref/marker_point.png) |
| `'x'`    | 叉号     | ![Sample of cross marker](https://ww2.mathworks.cn/help/matlab/ref/marker_x.png) |
| `'_'`    | 水平线条 | ![Sample of horizontal line marker](https://ww2.mathworks.cn/help/matlab/ref/marker_hline.png) |
| `'|'`    | 垂直线条 | ![Sample of vertical line marker](https://ww2.mathworks.cn/help/matlab/ref/marker_vline.png) |
| `'s'`    | 方形     | ![Sample of square marker](https://ww2.mathworks.cn/help/matlab/ref/marker_s.png) |
| `'d'`    | 菱形     | ![Sample of diamond line marker](https://ww2.mathworks.cn/help/matlab/ref/marker_d.png) |
| `'^'`    | 上三角   | ![Sample of upward-pointing triangle marker](https://ww2.mathworks.cn/help/matlab/ref/marker_uptriangle.png) |
| `'v'`    | 下三角   | ![Sample of downward-pointing triangle marker](https://ww2.mathworks.cn/help/matlab/ref/marker_downtriangle.png) |
| `'>'`    | 右三角   | ![Sample of right-pointing triangle marker](https://ww2.mathworks.cn/help/matlab/ref/marker_righttriangle.png) |
| `'<'`    | 左三角   | ![Sample of left-pointing triangle marker](https://ww2.mathworks.cn/help/matlab/ref/marker_lefttriangle.png) |
| `'p'`    | 五角形   | ![Sample of pentagram marker](https://ww2.mathworks.cn/help/matlab/ref/marker_p.png) |
| `'h'`    | 六角形   | ![Sample of hexagram marker](https://ww2.mathworks.cn/help/matlab/ref/marker_h.png) |
| `'none'` | 无标记   | 不适用                                                       |

# Matlab - plot Tex Font setting

- `\bf`
- `\it`
- `\sl`
- `\rm`
- `\fontname{宋体}`
- `\fontsize{16}`
- `\color{red(green yellow magenta blue black white cyan gray barkGreen orange lightblue)}`
- `_`为下标
- `^`为上标

![img](https://img-blog.csdnimg.cn/20210105143627512.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzQ1NTU4MQ==,size_16,color_FFFFFF,t_70)

![img](https://img-blog.csdnimg.cn/20210105143653133.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzQ1NTU4MQ==,size_16,color_FFFFFF,t_70)

![img](https://img-blog.csdnimg.cn/20210105143639152.png?x-oss-process=image/watermark,type_ZmFuZ3poZW5naGVpdGk,shadow_10,text_aHR0cHM6Ly9ibG9nLmNzZG4ubmV0L3dlaXhpbl80MzQ1NTU4MQ==,size_16,color_FFFFFF,t_70)

## Reference

<https://jingyan.baidu.com/article/c74d6000b0d41a0f6a595d29.html>

# 9 绘制 GIF

用到的函数：

```matlab
F = getframe         % 捕获显示在屏幕上当前坐标区作为影片帧。F是一个包含图像数据的结构体。getframe按照屏幕上显示的大小捕获这些坐标区，并不捕获坐标区轮廓外部的刻度标签或者其他内容
F = getframe(ax)     % 捕获ax标识的坐标区而非当前坐标区、
F = getframe(fig)    % 捕获由fig标识的图窗，如果需要捕获图窗窗口的整个内部区域（包括坐标区标题、标签和刻度线），则制定一个图窗。捕获的影片帧不包括图窗菜单和工具栏。
```



```matlab
[X,map] = frame2im(F); % 从单个影片帧F返回索引图像数据X和关联的颜色图Map。输出Map是一个三列矩阵，其中举证每一行是一个RGB三元值，用于定义颜色图的一种颜色。如果该帧包含真彩色数据，则Map为空。函数getframe和im2frame创建影片帧。
```



```matlab
[X,map] = rgb2ind(RGB,n) % 使用最小方差量化和抖动将RGB图像转换为索引图像X。map最多包含n个颜色，n必须小于65536
```



```matlab
imwrite(A,filename)      % 将图像数据A写入filename指定的文件，并从扩展名推断出文件格式。imwrite在当前文件夹中创建新文件。输出图像的位深度取决于A的数据类型和文件格式。
imwrite(A,map,filename)  % 

imwrite(__,fmt)

imwrite(__,Name,Value)
```



```matlab
cla; % 清楚当前axes中的所有图形
```

# 10 compass （绘制从原点出发的箭头）



# 11 annotation

## TextBos 属性

[文本框的外观和行为 - MATLAB - MathWorks 中国](https://ww2.mathworks.cn/help/matlab/ref/matlab.graphics.shape.textbox-properties.html)
