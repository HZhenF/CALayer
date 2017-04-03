//
//  ZFLayer.m
//  CALayer
//
//  Created by HZhenF on 17/4/3.
//  Copyright © 2017年 筝风放风筝. All rights reserved.
//

#import "ZFLayer.h"

@implementation ZFLayer

-(void)drawInContext:(CGContextRef)ctx
{
    //1.绘制图形
    CGContextAddEllipseInRect(ctx, CGRectMake(0, 0, 100, 100));
    
    CGContextSetRGBFillColor(ctx, 0, 1, 0, 1);
    
    //2.渲染图形
    CGContextFillPath(ctx);
}

@end
