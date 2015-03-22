//
//  MapOverlayView.m
//  BMWDemo
//
//  Created by Yuming Tao on 29/01/15.
//  Copyright (c) 2015 THU-IHFE. All rights reserved.
//

#import "MapOverlayView.h"

@implementation MapOverlayView

- (void)drawRect:(CGRect)rect {
    
    UIImage * startImage = [UIImage imageNamed:@"start.png"];
    UIImage * endImage = [UIImage imageNamed:@"end.png"];
    CGPoint startPoint = CGPointMake(50.0f/2, 700.0f/2);
    CGPoint endPoint = CGPointMake(590.0f/2, 240.0f/2);
    [startImage drawAtPoint:CGPointMake(startPoint.x-12, startPoint.y-43)];
    [endImage drawAtPoint:CGPointMake(endPoint.x-12, endPoint.y-43)];

    /* Get the current graphics context */
    CGContextRef currentContext =UIGraphicsGetCurrentContext();
    /* Set the width for the line */
    CGFloat radius = 15.0f;
    CGFloat dashLengths[] = {7, 7};
    CGContextSetLineWidth(currentContext,5.0f);
    //CGContextSetLineCap(currentContext, kCGLineCapRound);
    

    
    NSArray * brownPathArray = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(50.0f/2, 700.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(230.0f/2, 700.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(230.0f/2, 300.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(590.0f/2, 300.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(590.0f/2, 240.0f/2)], nil];
    [[UIColor colorWithRed:245.0f/255.0f green:133.0f/255.0f blue:31.0f/255.0f alpha:1.0] set];
    
    CGContextSetLineDash(currentContext, 0, dashLengths, 2);
    [self drawPathWithArcJoint:brownPathArray context:currentContext radius:radius];
    
    NSArray * purplePathArray = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(50.0f/2, 700.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(370.0f/2, 700.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(370.0f/2, 640.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(460.0f/2, 640.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(460.0f/2, 440.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(590.0f/2, 440.0f/2)],
                                [NSValue valueWithCGPoint:CGPointMake(590.0f/2, 240.0f/2)], nil];
    [[UIColor colorWithRed:162.0f/255.0f green:39.0f/255.0f blue:143.0f/255.0f alpha:1.0] set];

    CGContextSetLineDash(currentContext, 0, dashLengths, 2);
    [self drawPathWithArcJoint:purplePathArray context:currentContext radius:radius];
    
    NSArray * bluePathArray = [NSArray arrayWithObjects:[NSValue valueWithCGPoint:CGPointMake(50.0f/2, 700.0f/2)],
                               [NSValue valueWithCGPoint:CGPointMake(160.0f/2, 700.0f/2)],
                               [NSValue valueWithCGPoint:CGPointMake(160.0f/2, 510.0f/2)],
                               [NSValue valueWithCGPoint:CGPointMake(590.0f/2, 510.0f/2)],
                               [NSValue valueWithCGPoint:CGPointMake(590.0f/2, 240.0f/2)], nil];
    [[UIColor colorWithRed:123.0f/255.0f green:208.0f/255.0f blue:229.0f/255.0f alpha:1.0] set];
    CGContextSetLineDash(currentContext, 0, nil, 0);
    
    [self drawPathWithArcJoint:bluePathArray context:currentContext radius:radius];
}

- (void)drawPathWithArcJoint:(NSArray *)array context:(CGContextRef)context radius:(CGFloat)radius
{
    assert([array count] >= 3);
    CGPoint start = [array[0] CGPointValue];
    CGContextMoveToPoint(context, start.x, start.y);
    CGPoint current = start;
    CGPoint next;
    for (int i = 1; i < [array count]; i++) {
        next = [array[i] CGPointValue];
        CGContextAddArcToPoint(context, current.x, current.y, next.x, next.y, radius);
        current = next;
    }
    CGPoint end = [[array lastObject] CGPointValue];
    CGContextAddLineToPoint(context, end.x, end.y);
    CGContextStrokePath(context);
}

@end
