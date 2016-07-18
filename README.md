# iOS-UIBezierPath
### UIBezierPath类介绍

```objc
// 初始化方法
	+ (instancetype)bezierPath;
// 创建矩形
	+ (instancetype)bezierPathWithRect:(CGRect)rect;
// 创建圆形或者椭圆 这个方法根据传入的rect矩形参数绘制一个内切曲线。
	+ (instancetype)bezierPathWithOvalInRect:(CGRect)rect;
// 创建圆角矩形（椭圆）
	+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect cornerRadius:(CGFloat)cornerRadius; // rounds all corners with the same horizontal and vertical radius
// 创建可以指定圆角位置的矩形
	+ (instancetype)bezierPathWithRoundedRect:(CGRect)rect byRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;
/*
使用UIBezierPath创建一段弧线 其中的
参数分别指定：这段圆弧的中心，半径，开始角度，结束角度，是否顺时针方向
*/
	+ (instancetype)bezierPathWithArcCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise;
// 通过已有路径创建路径:
	+ (instancetype)bezierPathWithCGPath:(CGPathRef)CGPath;
// init方法
	- (instancetype)init NS_DESIGNATED_INITIALIZER;
// initWiteCoder方法：
	- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder NS_DESIGNATED_INITIALIZER;


// 将UIBezierPath类转换成CGPath，类似于UIColor的CGColor
@property(nonatomic) CGPathRef CGPath;
	- (CGPathRef)CGPath

// Path construction
// 初始点的位置坐标 x,y
	- (void)moveToPoint:(CGPoint)point;
// 结束点的位置坐标 
	- (void)addLineToPoint:(CGPoint)point;
// 绘制三次贝塞尔曲线
	- (void)addCurveToPoint:(CGPoint)endPoint controlPoint1:(CGPoint)controlPoint1 controlPoint2:(CGPoint)controlPoint2;
```
![](http://images2015.cnblogs.com/blog/799670/201510/799670-20151013172626304-936217179.png)

```objc 

// 绘制二次贝塞尔曲线
	- (void)addQuadCurveToPoint:(CGPoint)endPoint controlPoint:(CGPoint)controlPoint;
```
![](http://images2015.cnblogs.com/blog/799670/201510/799670-20151013173704351-1059522850.png)

```objc
// 绘制弧形线段
	- (void)addArcWithCenter:(CGPoint)center radius:(CGFloat)radius startAngle:(CGFloat)startAngle endAngle:(CGFloat)endAngle clockwise:(BOOL)clockwise 
// 结束绘制 会自动链接结束点和初始点
	- (void)closePath;
// 删除所有路径
	- (void)removeAllPoints;

/* 这两个方法不知道怎么用 有人会用的话 请告知 
     
     - (void)appendPath:(UIBezierPath *)bezierPath
     - (void)applyTransform:(CGAffineTransform)transform
     
*/

// Appending paths 
	- (void)appendPath:(UIBezierPath *)bezierPath;

// Modified paths
// 扭转路径，即起点变成终点，终点变成起点
	- (UIBezierPath *)bezierPathByReversingPath

// Transforming paths
// 路径进行仿射变换
	- (void)applyTransform:(CGAffineTransform)transform;

// Path info
// 只读类型，路径上是否有有效的元素
@property(readonly,getter=isEmpty) BOOL empty;
// 和view的bounds是不一样的，它获取path的X坐标、Y坐标、宽度，但是高度为0
@property(nonatomic,readonly) CGRect bounds;
// 当前path的位置，可以理解为path的终点
@property(nonatomic,readonly) CGPoint currentPoint;
// 接收器是否包含指定的点
	- (BOOL)containsPoint:(CGPoint)point;

// Drawing properties
// path宽度
@property(nonatomic) CGFloat lineWidth;
// path线端样式，有3种类型枚举
typedef CF_ENUM(int32_t, CGLineCap) {
    kCGLineCapButt,
    kCGLineCapRound,
    kCGLineCapSquare
};
@property(nonatomic) CGLineCap lineCapStyle;

```

![](http://oahmyhzk1.bkt.clouddn.com/image/blog/lineCapStyle%EF%BC%9Apath.png)

```objc
@property(nonatomic) CGLineJoin lineJoinStyle;
/* Line join styles. */

typedef CF_ENUM(int32_t, CGLineJoin) {
    kCGLineJoinMiter,
    kCGLineJoinRound,
    kCGLineJoinBevel
};
```
![](http://oahmyhzk1.bkt.clouddn.com/image/blog/lineJoinStyle.png)

```objc
// 最大斜接长度（只有在使用kCGLineJoinMiter是才有效）， 边角的角度越小，斜接长度就会越大
@property(nonatomic) CGFloat miterLimit; // Used when lineJoinStyle is kCGLineJoinMiter
// 弯曲路径的渲染精度，默认为0.6，越小精度越高，相应的更加消耗性能。
@property(nonatomic) CGFloat flatness;
// 一个bool值 指定even-odd规则是否在path可用
@property(nonatomic) BOOL usesEvenOddFillRule; // Default is NO. When YES, the even-odd fill rule is used for drawing, clipping, and hit testing.
// 绘制虚线
	- (void)setLineDash:(nullable const CGFloat *)pattern count:(NSInteger)count phase:(CGFloat)phase;
// 检索线型
- (void)getLineDash:(nullable CGFloat *)pattern count:(nullable NSInteger *)count phase:(nullable CGFloat *)phase;

// Path operations on the current graphics context
// 填充颜色
	- (void)fill;
// 描边，路径创建需要描边才能显示出来
	- (void)stroke;
//设置描边颜色，需要在设置后调用描边方法：
	[［UIColor blackColor］ setStroke];
// 设置填充颜色，需要在设置后调用填充方法
	[［UIColor redColor］ setFill];
	
// These methods do not affect the blend mode or alpha of the current graphics context
// 用指定的混合模式和透明度值来描绘受接收路径所包围的区域
	- (void)fillWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
// 使用指定的混合模式和透明度值沿着接收器路径。绘制一行
	- (void)strokeWithBlendMode:(CGBlendMode)blendMode alpha:(CGFloat)alpha;
// 修改当前图形上下文的绘图区域可见,随后的绘图操作导致呈现内容只有发生在指定路径的填充区域
	- (void)addClip;