//
//  ASDrawingView.m
//  ASDrawOnCanvasHW
//
//  Created by Alex Sergienko on 17.03.15.
//  Copyright (c) 2015 Alexandr Sergienko. All rights reserved.
//

#import "ASDrawingView.h"
#import "ViewController.h"

@interface ASDrawingView()

@property (assign, nonatomic) CGPoint startPoint;
@property (assign, nonatomic) NSInteger lineWidth;
@property (assign, nonatomic) BOOL isDrawing;
@end


@implementation ASDrawingView

#pragma mark - Touches

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.isDrawing = NO;
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    self.isDrawing = YES;
    UITouch *touch = [touches anyObject];
    CGPoint currentPoint = [touch locationInView:self];
    
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    [self.canvas.image drawInRect:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
    
    CGContextSetLineCap(context, kCGLineCapRound);
    CGContextSetBlendMode(context, kCGBlendModeNormal);
    CGContextSetLineWidth(context, fontSize);
    if (!colorRGB) {
        CGContextSetStrokeColorWithColor(context, color);
    } else {
        CGContextSetRGBStrokeColor(context, colorR, colorG, colorB, 1.0);
    }
    CGContextMoveToPoint(context, self.startPoint.x, self.startPoint.y);
    CGContextAddLineToPoint(context, currentPoint.x, currentPoint.y);
    CGContextStrokePath(context);
    
    self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
    [self.canvas setAlpha:alpha];
    UIGraphicsEndImageContext();
    
    
    self.startPoint = currentPoint;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if (!self.isDrawing) {
        
        UIGraphicsBeginImageContext(self.frame.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        
        [self.canvas.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        
        CGContextSetLineCap(context, kCGLineCapRound);
        CGContextSetBlendMode(context, kCGBlendModeNormal);
        CGContextSetLineWidth(context, fontSize);
        CGContextSetAlpha(context, alpha);
        if (!colorRGB) {
            CGContextSetStrokeColorWithColor(context, color);
            
        } else {
            CGContextSetRGBStrokeColor(context, colorR, colorG, colorB, alpha);
        }
        CGContextMoveToPoint(context, self.startPoint.x, self.startPoint.y);
        CGContextAddLineToPoint(context, self.startPoint.x, self.startPoint.y);
        CGContextStrokePath(context);
        self.canvas.image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    UIGraphicsBeginImageContext(self.mainCanvas.frame.size);
    [self.mainCanvas.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:1.0];
    [self.canvas.image drawInRect:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) blendMode:kCGBlendModeNormal alpha:alpha];
    self.mainCanvas.image = UIGraphicsGetImageFromCurrentImageContext();
    self.canvas.image = nil;
    UIGraphicsEndImageContext();
    
}


- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
}


@end
