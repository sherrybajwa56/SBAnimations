//
//  SBSlider.h
//  DemoSlider
//
//  Created by Mobikasa on 28/08/17.
//  Copyright © 2017 Mobikasa. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^changedValueNotificationBlock)(NSInteger type);

@interface SBSlider : UIView

@property(strong ,nonatomic) changedValueNotificationBlock changedValueNotificationblock;
@end
