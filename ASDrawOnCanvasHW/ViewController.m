//
//  ViewController.m
//  ASDrawOnCanvasHW
//
//  Created by Alex Sergienko on 13.03.15.
//  Copyright (c) 2015 Alexandr Sergienko. All rights reserved.
//

#import "ViewController.h"
#import "ASDrawingView.h"
#import "ASCurrentColorView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    
    [super viewDidLoad];
    fontSize = 1.0f;
    color = [UIColor blackColor].CGColor;
    alpha = 1.f;
    colorRGB = NO;
    self.currentColorView.layer.borderWidth = 1.f;
    self.currentColorView.layer.borderColor = [UIColor blackColor].CGColor;
    self.currentColorView.backgroundColor = [UIColor blackColor];
}


- (void) didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
}


#pragma mark - Actions

- (IBAction) setLineSizeBySlider:(UISlider *)sender {
    
    fontSize = (NSInteger)self.lineSizeSlider.value;
    self.lineSizeLabel.text = [NSString stringWithFormat:@"%ld", fontSize];
}


- (IBAction) setButtonColor:(UIButton *)button {

    colorRGB = NO;

    //Long version
    /*if (button.tag == 0) {
        color = [UIColor redColor].CGColor;
    } else if (button.tag == 1) {
        color = [UIColor orangeColor].CGColor;
    } else if (button.tag == 2) {
        color = [UIColor yellowColor].CGColor;
    } else if (button.tag == 3) {
        color = [UIColor greenColor].CGColor;
    } else if (button.tag == 4) {
        color = [UIColor cyanColor].CGColor;
    } else if (button.tag == 5) {
        color = [UIColor blueColor].CGColor;
    } else if (button.tag == 6) {
        color = [UIColor purpleColor].CGColor;
    } else if (button.tag == 7) {
        color = [UIColor whiteColor].CGColor;
    [self.currentColorView showCurrentColor];
    }*/
    
    //Short version
    NSArray *availableColors = [[self class] arrayOfAvailableColors];
    UIColor *setColor = availableColors [button.tag];
    color = setColor.CGColor;
    [self.currentColorView showCurrentColor];
}


- (IBAction) setLineAlphaBySlider:(UISlider *)sender {
    
    alpha = self.lineAlphaSlider.value;
    self.lineAlphaLabel.text = [NSString stringWithFormat:@"%.2f", alpha];
    [self.currentColorView showCurrentColor];
}


- (IBAction) setLineRGBColor:(UISlider *)sender {
    
    colorRGB = YES;
    self.lineColorRLabel.text = [NSString stringWithFormat:@"%ld", (NSInteger)self.lineColorRSlider.value];
    self.lineColorGLabel.text = [NSString stringWithFormat:@"%ld", (NSInteger)self.lineColorGSlider.value];
    self.lineColorBLabel.text = [NSString stringWithFormat:@"%ld", (NSInteger)self.lineColorBSlider.value];
    colorR = self.lineColorRSlider.value / 255;
    colorG = self.lineColorGSlider.value / 255;
    colorB = self.lineColorBSlider.value / 255;
    
    [self.currentColorView showCurrentColor];
}


- (IBAction) setCleanPage: (UIButton *) button {
    
    self.drawingView.mainCanvas.image = nil;
}


#pragma mark - Additional

+ (NSArray *) arrayOfAvailableColors {
    
    static NSArray *colors;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        colors = @[[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor cyanColor], [UIColor blueColor], [UIColor purpleColor], [UIColor whiteColor]];
    });
    return colors;
}


@end
