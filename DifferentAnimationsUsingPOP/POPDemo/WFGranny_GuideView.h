//
//  Grannydemo.h
//  POPDemo
//
//  Created by mobikasa on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WFGranny_GuideView : UIView

@property (weak, nonatomic) IBOutlet UIImageView *granny;
@property (weak, nonatomic) IBOutlet UIView *message;
@property (weak, nonatomic) IBOutlet UIImageView *bubble;
@property (weak, nonatomic) IBOutlet UILabel *lbl_message;
@property(weak ,nonatomic) IBOutlet NSLayoutConstraint *grannyXPostion;
@property(weak ,nonatomic) IBOutlet NSLayoutConstraint *viewXPostion;
@property(weak ,nonatomic) IBOutlet NSLayoutConstraint *viewYPostion;
@property(weak ,nonatomic) IBOutlet NSLayoutConstraint *viewwidth;
@property(weak ,nonatomic) IBOutlet NSLayoutConstraint *viewheight;



-(instancetype)initWithFrame:(CGRect)frame withMessage:(NSString *)bubblemessge;







@end
