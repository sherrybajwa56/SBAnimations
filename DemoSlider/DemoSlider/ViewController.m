//
//  ViewController.m
//  DemoSlider
//
//  Created by Mobikasa on 28/08/17.
//  Copyright © 2017 Mobikasa. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIGestureRecognizerDelegate>
{
    UIPanGestureRecognizer *pann;
}
@property (strong, nonatomic) IBOutlet SBSlider *sliderView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _sliderView.changedValueNotificationblock = ^(NSInteger type) {
        NSLog(@"%li",(long)type);
    };
   //_sliderview.changedValueNotificationblock = ^(NSInteger type) {
     
    
   //};
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
