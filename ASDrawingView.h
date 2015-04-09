//
//  ASDrawingView.h
//  ASDrawOnCanvasHW
//
//  Created by Alex Sergienko on 17.03.15.
//  Copyright (c) 2015 Alexandr Sergienko. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;

@interface ASDrawingView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *canvas;
@property (weak, nonatomic) IBOutlet UIImageView *mainCanvas;

@end
