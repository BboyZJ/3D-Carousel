//
//  UpDownView.m
//  UpDownView-Demo
//
//  Created by 张建 on 2017/4/24.
//  Copyright © 2017年 JuZiShu. All rights reserved.
//

#import "UpDownView.h"
#import "ShowView.h"
#import "UpDownModel.h"

@interface UpDownView ()<CAAnimationDelegate>
{
    NSInteger index;
}
@property (nonatomic,strong)ShowView * showView;
@property (nonatomic,strong)NSMutableArray * dataArray;

@end


@implementation UpDownView

- (instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self initUI];
    }
    
    return self;
}

//初始化视图
- (void)initUI{
    
    _showView = [[ShowView alloc] init];
    _showView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    _showView.userInteractionEnabled = YES;
    [self addSubview:_showView];
    
    //添加点击的事件
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showViewClick:)];
    [_showView addGestureRecognizer:tap];
    
}

//刷新数据
- (void)refreshViewWithDataArr:(NSMutableArray *)dataArr{
    
    _dataArray = dataArr;
    
    _showView.model = _dataArray[0];
    
    //设置定时器
    [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
    
}

- (void)displayNews{
    
    index ++;
    if (index >= _dataArray.count) {
        
        index = 0;
    }
    /** type
     *
     *  各种动画效果  其中除了'fade', `moveIn', `push' , `reveal' ,其他属于似有的API(我是这么认为的,可以点进去看下注释).
     *  ↑↑↑上面四个可以分别使用'kCATransitionFade', 'kCATransitionMoveIn', 'kCATransitionPush', 'kCATransitionReveal'来调用.
     *  @"cube"                     立方体翻滚效果
     *  @"moveIn"                   新视图移到旧视图上面
     *  @"reveal"                   显露效果(将旧视图移开,显示下面的新视图)
     *  @"fade"                     交叉淡化过渡(不支持过渡方向)             (默认为此效果)
     *  @"pageCurl"                 向上翻一页
     *  @"pageUnCurl"               向下翻一页
     *  @"suckEffect"               收缩效果，类似系统最小化窗口时的神奇效果(不支持过渡方向)
     *  @"rippleEffect"             滴水效果,(不支持过渡方向)
     *  @"oglFlip"                  上下左右翻转效果
     *  @"rotate"                   旋转效果
     *  @"push"
     *  @"cameraIrisHollowOpen"     相机镜头打开效果(不支持过渡方向)
     *  @"cameraIrisHollowClose"    相机镜头关上效果(不支持过渡方向)
     */
    
    /** type
     *
     *  kCATransitionFade            交叉淡化过渡
     *  kCATransitionMoveIn          新视图移到旧视图上面
     *  kCATransitionPush            新视图把旧视图推出去
     *  kCATransitionReveal          将旧视图移开,显示下面的新视图
     */
    /** subtype
     *
     *  各种动画方向
     *
     *  kCATransitionFromRight;      同字面意思(下同)
     *  kCATransitionFromLeft;
     *  kCATransitionFromTop;
     *  kCATransitionFromBottom;
     */
    
    /** subtype
     *
     *  当type为@"rotate"(旋转)的时候,它也有几个对应的subtype,分别为:
     *  90cw    逆时针旋转90°
     *  90ccw   顺时针旋转90°
     *  180cw   逆时针旋转180°
     *  180ccw  顺时针旋转180°
     */

    CATransition * animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.5;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"cube";
    animation.subtype = kCATransitionFromBottom;
    
    [_showView.layer addAnimation:animation forKey:@"animatioID"];
    
    UpDownModel * model = _dataArray[index];
    _showView.model = model;
    
    
}

//上下滚动点击事件
- (void)showViewClick:(UITapGestureRecognizer *)tap{
    
    NSLog(@"点击上下滚动视图:%ld",index);
}

@end
