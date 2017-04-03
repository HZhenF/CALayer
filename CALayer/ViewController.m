//
//  ViewController.m
//  CALayer
//
//  Created by HZhenF on 17/3/31.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "ViewController.h"
#import "ZFLayer.h"

@interface ViewController ()<CALayerDelegate>

@property(nonatomic,strong) UIView *customView;

@end

@implementation ViewController

-(UIView *)customView
{
    if (!_customView) {
        _customView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        [self.view addSubview:_customView];
    }
    return _customView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
 
//    [self layerBasicSetting];
    
    
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor cyanColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
//    layer.position = CGPointMake(100, 100);
    //
    [self.view.layer addSublayer:layer];
    
    NSLog(@"frame:%@",NSStringFromCGRect(layer.frame));
    NSLog(@"anchorPoint:%@",NSStringFromCGPoint(layer.anchorPoint));
    NSLog(@"position:%@",NSStringFromCGPoint(layer.position));
    
    [self customLayer];
    [self customZFLayer];
    
}



/**重写CALayer的方法*/
-(void)customZFLayer
{
    ZFLayer *ly = [ZFLayer layer];
    ly.backgroundColor = [UIColor yellowColor].CGColor;
    ly.position = CGPointMake(200, 400);
    ly.anchorPoint = CGPointZero;
    ly.bounds = CGRectMake(0, 0, 100, 100);
    //想要调用自定义ZFLayer类中重写的drawInContext，必须调用这个方法
    [ly setNeedsDisplay];
    [self.view.layer addSublayer:ly];
}

/**CALayer代理方法*/
-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //1.绘制图形
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    //2.渲染图形
    CGContextFillPath(ctx);
}

/**自定义CALayer的frame设置*/
-(void)customLayer
{
    
    //Log只是验证自定义CALayer已经加入了
     NSLog(@"star --%@",self.view.layer.sublayers);
     
     CALayer *layer = [CALayer layer];
     layer.backgroundColor = [UIColor redColor].CGColor;
     layer.bounds = CGRectMake(0, 0, 100, 100);
     layer.position = CGPointMake(200, 200);
//     layer.borderWidth = 10;
//     layer.cornerRadius = 10;
    layer.delegate = self;
    [layer setNeedsDisplay];
     [self.view.layer addSublayer:layer];
     
     NSLog(@"end --%@",self.view.layer.sublayers);
    
    // 如果一个控制是另外一个控件的子控件, 那么这个控件中的layer也是另外一个控件的子layer
}

/**点击屏幕后，自定义CALayer的变化*/
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    self.customView.layer.transform = CATransform3DMakeTranslation(0, 100, 0);
    //也可以用KVC来设置
//    NSValue *value =[NSValue valueWithCATransform3D:CATransform3DMakeTranslation(0, 100, 0)];
//    [self.customView.layer setValue:value forKeyPath:@"transform"];
//        self.customView.layer.transform = CATransform3DMakeRotation(M_PI_4, 0, 0, 9998);
//    self.customView.layer.transform = CATransform3DMakeScale(1.5, 1.5, 0);
}


/**UIImageView的layer的frame设置*/
-(void)layerSetupFrame
{
    self.customView.backgroundColor = [UIColor cyanColor];
    self.customView.layer.borderColor = [UIColor orangeColor].CGColor;
    self.customView.layer.borderWidth = 10;
    self.customView.layer.cornerRadius = 10;
    self.customView.layer.masksToBounds = YES;
    //类似于center
    self.customView.layer.position = CGPointMake(200, 300);
}

/**UIImageView的layer演示*/
-(void)layerBasicSetting
{
    self.customView.backgroundColor = [UIColor yellowColor];
    //设置layer边框
    self.customView.layer.borderWidth = 10;
    self.customView.layer.borderColor = [UIColor orangeColor].CGColor;
    self.customView.layer.cornerRadius = 20;
    //设置的image不是展示在主图层上的，而是展示在子图层上的
    self.customView.layer.contents = (id)[UIImage imageNamed:@"me"].CGImage;
    //设置阴影颜色
    self.customView.layer.shadowColor = [UIColor redColor].CGColor;
    //设置阴影偏移量,正数为右边偏移
    self.customView.layer.shadowOffset = CGSizeMake(10, 10);
    self.customView.layer.shadowOpacity = 1;
    
    //剪切掉多余的部分，把阴影也剪切掉了
    //    self.customView.clipsToBounds = YES;
    self.customView.layer.masksToBounds = YES;
}




@end
