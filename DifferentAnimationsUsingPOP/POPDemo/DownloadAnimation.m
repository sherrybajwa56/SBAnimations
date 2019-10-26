//
//  DownloadAnimation.m
//  POPDemo
//
//  Created by mobikasa on 4/22/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "DownloadAnimation.h"
#import "Downloadbutton.h"

@interface DownloadAnimation ()

@end

@implementation DownloadAnimation

- (void)viewDidLoad {
    [super viewDidLoad];
    Downloadbutton *button=[[Downloadbutton alloc]initWithButtonDiameter:60 center:self.view.center];
    [self.view addSubview:button];

// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
