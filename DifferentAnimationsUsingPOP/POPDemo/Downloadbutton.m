//
//  Downloadbutton.m
//  POPDemo
//
//  Created by mobikasa on 4/22/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "Downloadbutton.h"
#import "POP.h"
#import "UIColor+FlatColors.h"


@interface Downloadbutton () <POPAnimationDelegate> {
    CGFloat _progressLength;
    CGFloat _diameter;
}
@property (nonatomic, strong) UIView *mainButton;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, strong) UIImageView *iconView;
@property (nonatomic, strong) UIView *progressBar;

//@property (nonatomic, strong) UIColor *progressBarColor;

@end
@implementation Downloadbutton
-(instancetype)initWithButtonDiameter:(CGFloat)diameter center:(CGPoint)center
{
    self=[super init];
    if(self)
    {
        
        _diameter=diameter;
        self.frame=CGRectMake(center.x-diameter/2, center.y-diameter/2,diameter,diameter);
        self.backgroundColor=[UIColor clearColor];
        _mainButton=[[UIView alloc]initWithFrame:CGRectMake(0, 0, diameter, diameter)];
          _icon=[UIImage imageNamed:@"iconic.png"];
       
        _mainButton.contentMode=UIViewContentModeScaleAspectFill;
      //  _icon=[UIImage imageNamed:@"iconic.png"];
        _mainButton.backgroundColor=[UIColor colorWithPatternImage:_icon];//[UIColor purpleColor];
        _mainButton.layer.cornerRadius=diameter/2;
        UITapGestureRecognizer *tap=[[UITapGestureRecognizer alloc ]initWithTarget:self action:@selector(tappedview:)];
        [_mainButton addGestureRecognizer:tap];
        
         [self addSubview:_mainButton];
        
        
        }
    return self;
}


-(void)tappedview:(UITapGestureRecognizer *)tapGesture
{
    POPSpringAnimation *anime=[POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
   anime.toValue=[NSValue valueWithCGRect:CGRectMake(0 , 0, _mainButton.bounds.size.width*4, _mainButton.bounds.size.height*0.3)];
    _mainButton.layer.cornerRadius=11.f;
     _icon=[UIImage imageNamed:@""];
   // _mainButton.backgroundColor=[UIColor purpleColor];
    _mainButton.backgroundColor=[UIColor whiteColor];
    anime.springBounciness=5.f;
    
    anime.delegate=self;
    [_mainButton pop_addAnimation:anime forKey:@"stretched"];
    [anime setValue:@"stretched" forKey:@"animname"];
    
    
    
    
}
- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished {
    if(finished){
    if([[anim valueForKey:@"animname"] isEqualToString:@"stretched"])
       {
        [self addprogressbar];
        }
        else if ([[anim valueForKey:@"animname"] isEqualToString:@"progressbar"])
        {
        [self addtickbuttonview];
        }
        
        else if ([[anim valueForKey:@"animname"] isEqualToString:@"toGreen"])
        {
            [self addIconToMainButton:[UIImage imageNamed:@"Tick@2x.png"]];
        }
    }
}

-(void)addprogressbar
{
    _progressBar=[[UIView alloc]initWithFrame:CGRectMake(0,0,0,_mainButton.frame.size.height)];
    
    _progressBar.backgroundColor=[UIColor flatSilverColor];
    _progressBar.layer.cornerRadius=5.f;
    
    [_mainButton addSubview:_progressBar];
    
    POPBasicAnimation *anime=[POPBasicAnimation animationWithPropertyNamed:kPOPViewFrame];
     anime.toValue = [NSValue valueWithCGRect:CGRectMake(0,0,_mainButton.frame.size.width,_mainButton.frame.size.height)];
         anime.beginTime = CACurrentMediaTime()+0.45;
     anime.duration = 2;

    //anime.springSpeed=10.f;
    anime.delegate=self;
    [_progressBar pop_addAnimation:anime forKey:@"progressbar"];
    [anime setValue:@"progressbar" forKey:@"animname"];
    

}
-(void)addIconToMainButton:(UIImage *)icon{
    
    NSLog(@"dsjfksj");
    UIImageView *iconView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _diameter, _diameter)];
    iconView.image = icon;
    [iconView sizeToFit];
    iconView.center = CGPointMake(_diameter/2, _diameter/2);
    [self.mainButton addSubview:iconView];
}

-(void)addtickbuttonview
{
    
    NSLog(@"addtick is running");
    [_progressBar removeFromSuperview];
    POPSpringAnimation *roundIt = [POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
    roundIt.toValue=[NSValue valueWithCGRect:CGRectMake(0, 0, _diameter, _diameter)];
    roundIt.springBounciness=10.f;
   
       _mainButton.layer.cornerRadius=_diameter/2;

    [self.mainButton pop_addAnimation:roundIt forKey:@"backToRound"];
    POPBasicAnimation *anime = [POPBasicAnimation animationWithPropertyNamed:kPOPViewBackgroundColor];
   
    anime.delegate = self;
    anime.toValue = [UIColor flatEmeraldColor];
    [self.mainButton pop_addAnimation:anime forKey:@"toGreen"];
     [anime setValue:@"toGreen" forKey:@"animname"];
    
}

@end
