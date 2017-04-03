//
//  ZFView.m
//  CALayer
//
//  Created by HZhenF on 17/4/3.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "ZFView.h"

@implementation ZFView



-(void)drawRect:(CGRect)rect
{
    //1.获取上下文layer
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    //2.绘制图形
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    
    //3.渲染
    CGContextFillPath(ctx);
}

@end
