//
//  SBSlider.m
//  DemoSlider
//
//  Created by Mobikasa on 28/08/17.
//  Copyright © 2017 Mobikasa. All rights reserved.
//

#import "SBSlider.h"
@interface SBSlider ()<UIGestureRecognizerDelegate>{
    
    UIPanGestureRecognizer *moveButtonSlider;
    BOOL isAlready;
    CGRect Viewframe;
    NSInteger diffrence;
    NSInteger currentIndex;
    
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *btn_xposition;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *view_filled_width;
@property (weak, nonatomic) IBOutlet UIButton *btn_slider;

@property (weak, nonatomic) IBOutlet UIImageView *img_vw;


@end
@implementation SBSlider

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame{
    
    self = [super initWithFrame:frame];
    if (self) {
        
        
    }
    return self;


}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if(self){
        // [self nibSetup];
       
    }
    return self;
}


-(void)layoutSubviews{
    
   // NSLog(@"%@",NSStringFromCGRect(self.frame));
    
    if(!isAlready){
         [self nibSetup];
    }
   
}
-(void)nibSetup{
    
    currentIndex = 0;
    isAlready = YES;
    NSArray *array1 =[[NSBundle mainBundle] loadNibNamed:@"SBSlider" owner:self options:nil];
    
    UIView *mainView = [array1 firstObject];
    
    Viewframe = self.frame;
    mainView.frame = self.bounds;
    diffrence = self.bounds.size.width / 5;
    
    [self addSubview:mainView];

    moveButtonSlider  = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    
    moveButtonSlider.delegate = self;
    
    [_img_vw addGestureRecognizer:moveButtonSlider];
    /*
     let nibArray = Bundle.main.loadNibNamed("MenuBarVC", owner: self, options: nil)
     
     mainview = nibArray?.first as! UIView
     
     mainview.frame = self.bounds
     
     self.addSubview(mainview)
     
     Setupview()

     */

}


-(void)panAction:(UIPanGestureRecognizer*)pan
{
    if(pan.state==UIGestureRecognizerStateEnded)
     {
         
        self.img_vw.center = _btn_slider.center;
     }
    
     else{
         
         CGPoint touchLocation = [pan locationInView:self];

         if(touchLocation.x >= -5 && touchLocation.x <= (Viewframe.size.width-Viewframe.origin.x)){
             
             self.img_vw.center = touchLocation;
             
             self.btn_xposition.constant = touchLocation.x;
             
             self.view_filled_width.constant = touchLocation.x+10;
             
             [self setNeedsDisplay];
             [self setNeedsLayout];
             
             int dividend = touchLocation.x + Viewframe.origin.x;
            // int reminder = dividend % diffrence;
        //     NSLog(@"currentIndex = ");
             NSInteger valuetopass = dividend/diffrence;

                 if(currentIndex != valuetopass )
                 {
                     currentIndex = valuetopass;
                     if(_changedValueNotificationblock){
                         
                         
                         _changedValueNotificationblock(currentIndex);
                     }
 
                 }
             
             
         }
     }
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    
    return YES;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
