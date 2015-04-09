//
//  ASCurrentColorView.m
//  ASDrawOnCanvasHW
//
//  Created by Alex Sergienko on 17.03.15.
//  Copyright (c) 2015 Alexandr Sergienko. All rights reserved.
//

#import "ASCurrentColorView.h"
#import "ViewController.h"

@implementation ASCurrentColorView


- (void) showCurrentColor {
    
    if (colorRGB) {
        self.backgroundColor = [UIColor colorWithRed:colorR green:colorG blue:colorB alpha:alpha];
    } else {
        self.backgroundColor = [[UIColor colorWithCGColor:color] colorWithAlphaComponent:alpha];
    }
}

@end
