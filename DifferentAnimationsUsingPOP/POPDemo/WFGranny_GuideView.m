//
//  Grannydemo.m
//  POPDemo
//
//  Created by mobikasa on 9/28/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "WFGranny_GuideView.h"
#import "POP.h"

@interface WFGranny_GuideView()
{
    NSString *mess;
    CGFloat Heightforbubble;
}

@end

@implementation WFGranny_GuideView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];

       if(self)
       {
           [self setInitialView];
           
           
              // self.backgroundColor=[UIColor grayColor];

             //[self setbasicAnimation];
        
        }
    
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame withMessage:(NSString *)bubblemessge
{
    self = [super initWithFrame:frame];
    
    if(self)
    {
        
        mess=bubblemessge;
        
        Heightforbubble=[self calculateHeightForString:bubblemessge forFont:[UIFont fontWithName:@"Trebuchet MS" size:14] withWidth:100].height;
        
                [self setInitialView];
   
    }
    
    return self;
}


-(void)setInitialView
{
    UIView *grannyView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"WFGranny_GuideView" owner:self options:nil] firstObject];
    
    _lbl_message.text=mess;

    grannyView.frame = self.bounds;
    [self addSubview:grannyView];
    
    
    _message.hidden=YES;

    [self setbasicAnimation];
}



-(void)setbasicAnimation
{
   POPSpringAnimation *anime = [POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
    
    
    anime.toValue=@(0);
    anime.springBounciness=10;
        anime.delegate=self;
    [_grannyXPostion pop_addAnimation:anime forKey:@"move"];

    
    POPBasicAnimation *anim = [POPBasicAnimation animationWithPropertyNamed:kPOPViewAlpha];
    
    //anim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
   // anim.fromValue = @(0.0);
    anim.toValue = @(1.0);
    anim.duration =3;
    [_granny pop_addAnimation:anim forKey:@"fade"];
 }

- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished
{
    if(finished)
    {
        
           _message.hidden=NO;
        
        POPSpringAnimation *size=[POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
        
        
        size.toValue =@(Heightforbubble+100);
        
        size.springSpeed =20.f;
        
       // size.springBounciness=2;
        
         [_viewwidth pop_addAnimation:size forKey:@"_view"];

            POPSpringAnimation *sizeh=[POPSpringAnimation animationWithPropertyNamed:kPOPLayoutConstraintConstant];
        
              size.springSpeed =20.f;

              sizeh.toValue = @(Heightforbubble+80);
   
             [_viewheight pop_addAnimation:sizeh forKey:@"_viewheight"];
        

        
        
        
    }
}

-(CGSize)calculateHeightForString:(id)str forFont:(UIFont *)font withWidth:(CGFloat)width
{
    UILabel *label = [[UILabel alloc]init];
    
    [label setText:(NSString*)str];
    
    [label setFont:font];
    label.textAlignment = NSTextAlignmentCenter;
    [label setNumberOfLines:0];
    [label setLineBreakMode:NSLineBreakByWordWrapping];
    [label setPreferredMaxLayoutWidth:width];
    CGSize size = [label sizeThatFits:CGSizeMake(width, FLT_MAX)];
    
    return size;
}



@end
