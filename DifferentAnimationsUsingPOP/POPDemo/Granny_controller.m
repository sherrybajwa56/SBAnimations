//
//  Granny_controller.m
//  POPDemo
//
//  Created by mobikasa on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "Granny_controller.h"

#import "WFGranny_GuideView.h"

@interface Granny_controller ()

@property(strong,nonatomic)IBOutlet UIView *upperview;

@end

@implementation Granny_controller

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{ WFGranny_GuideView *demo =[[WFGranny_GuideView alloc]initWithFrame:_upperview.frame withMessage:@"welcome to this page please bls asdfj asd as dasd"];
    
    [self.upperview addSubview:demo];


}

-(void)viewDidLayoutSubviews
{
   }


@end
