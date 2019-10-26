//
//  CardAnimation.m
//  POPDemo
//
//  Created by mobikasa on 4/25/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "CardAnimation.h"
#import "POP.h"
@interface CardAnimation ()


@property (strong, nonatomic)NSMutableArray *colorArray;

@property(strong,nonatomic)NSMutableArray *cardsArray;
@property(readwrite,assign)CGPoint decayfinal;
@property(strong,nonatomic)UIView *currentpanview;
@property (strong, nonatomic)UIView *containerview;
@property(strong,nonatomic)NSArray *ImageArray;
//
//
//



@end


@implementation CardAnimation

NSInteger Cviewwidth;
NSInteger Cheightwidth;
NSInteger count=8;
CGFloat width;
CGFloat height;

CGFloat xlocations[16]={300.f,40.f,25.f,66.f,36.f,120.f,24.f,140.f,300.f,40.f,250.f,66.f,360.f,120.f,240.f,140.f};
CGFloat rotations[16]={0.6f,0.7f,0.5,0.5f,0.f,0.f,0.f,0.f,0.6f,0.7f,0.5,0.5f,0.f,0.f,0.f,0.f};


-(id)initWithFrame:(CGRect)frame WithImageArray:(NSArray*)imagearray
{
    self =[super init];
    if(self)
    {
       // [self setframe:frame];
       // [CreateCards:frame:imagearray];
    }
    return self;
}

-(id)initWithView:(UIView*)view
{
    self =[super init];
    if(self)
    {
        _containerview =view;
        [self initialize];
        [self CreateCards];
        [self setbasicAnimation];
        
    }
    return self;

}

-(id)initWithview:(UIView*)view  ImageArray:(NSArray*)imagearray
{
    self =[super init];
    if(self)
    {
        _ImageArray=imagearray;
        count=[imagearray count];
        [self initialize];
        [self CreateCards];
        
        
    }
    return self;

}


-(void)initialize
{
    _cardsArray=[NSMutableArray new];
    _colorArray=[NSMutableArray arrayWithObjects:
                 [UIColor colorWithRed:(245/255.0) green:(224/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(177/255.0)  green:(224/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(255/255.0)  green:(255/255.0) blue:(143/255.0) alpha:1],
                 [UIColor colorWithRed:(237/255.0)  green:(199/255.0) blue:(241/255.0) alpha:1],
                 [UIColor colorWithRed:(200/255.0) green:(224/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(177/255.0)  green:(166/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(200/255.0) green:(100/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(333/255.0)  green:(166/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(245/255.0) green:(224/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(177/255.0)  green:(224/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(255/255.0)  green:(255/255.0) blue:(143/255.0) alpha:1],
                 [UIColor colorWithRed:(237/255.0)  green:(199/255.0) blue:(241/255.0) alpha:1],
                 [UIColor colorWithRed:(200/255.0) green:(224/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(177/255.0)  green:(166/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(200/255.0) green:(100/255.0) blue:(211/255.0) alpha:1],
                 [UIColor colorWithRed:(333/255.0)  green:(166/255.0) blue:(211/255.0) alpha:1],nil];
    
    
}



-(void)CreateCards
{
    
    for(int i=0;i<count;i++)
    {
        
        NSUInteger randomx=arc4random_uniform(_containerview.frame.size.width);
        
        UIView *view =[[UIView alloc]initWithFrame:CGRectMake(randomx,-300, _containerview.frame.size.width*0.3,_containerview.frame.size.height*0.5)];
        view.backgroundColor=[_colorArray objectAtIndex:i];
        view.layer.cornerRadius=5;
        UIImageView *imgvw=[[UIImageView alloc]initWithFrame:CGRectMake(4,4,view.frame.size.width*0.9,view.frame.size.height*0.7)];
        imgvw.backgroundColor=[UIColor whiteColor];
        [view addSubview:imgvw];
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        [view addGestureRecognizer:pan];
        [_cardsArray addObject:view];
        [_containerview addSubview:view];
        
    }

}

-(void)panAction:(UIPanGestureRecognizer*)pan
{
    
    
    if (pan.state == UIGestureRecognizerStateChanged) {
        
        POPDecayAnimation *anim = [POPDecayAnimation animationWithPropertyNamed:kPOPLayerPosition];
        anim.velocity =[NSValue valueWithCGPoint:CGPointMake([pan velocityInView:/_containerview].x, [pan velocityInView:_containerview].y)];
        
        
        // velocity=CGPointMake([pan velocityInView:self.view].x, [pan velocityInView:self.view].y);
        
        
        anim.deceleration = 0.99;
        anim.delegate=self;
        _currentpanview=pan.view;
        
        [pan.view pop_addAnimation:anim forKey:@"slide"];
        
        
    }
    else if(pan.state==UIGestureRecognizerStateBegan)
    {
        CGPoint translation = [pan translationInView:self.containerview];
        
        pan.view.center = CGPointMake(pan.view.center.x + translation.x, pan.view.center.y);
        
        [pan setTranslation:CGPointZero inView:self.containerview];
    }
    
    
}

-(void)setbasicAnimation
{
    UIView *card =_cardsArray[0];
    width=_containerview.frame.size.width-card.frame.size.width;
    // height=_containervw.frame.size.height-card.frame.size.height;
    height=_containerview.frame.size.height;
     
    for (int i=0; i<count; i++)
    {
        // CGFloat value=rotations[i];
        NSUInteger randomxf=arc4random_uniform(width+200);
        
        
        UIView *view1 =_cardsArray[i];
        
        POPBasicAnimation *rotateanim=[POPBasicAnimation animationWithPropertyNamed:kPOPLayerRotation];
        rotateanim.fromValue=@(rotations[i]);
        rotateanim.toValue = @(rotations[count-i]);
        rotateanim.duration = 3;
        [view1.layer pop_addAnimation:rotateanim forKey:@"key"];
        POPBasicAnimation *ani=[POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
        //           ani.toValue=[NSValue valueWithCGPoint:CGPointMake(xlocations[i],ylocations[i])];
        ani.toValue=[NSValue valueWithCGPoint:CGPointMake(randomxf,height+50)];
        ani.beginTime = CACurrentMediaTime()+xlocations[i]/200;
        //ani.beginTime = CACurrentMediaTime()+randomxf/400;
        
        ani.duration = 5;
        [view1.layer pop_addAnimation:ani forKey:@"shufflgin"];
    }
}

- (void)pop_animationDidStop:(POPAnimation *)anim finished:(BOOL)finished
{
    if(finished)
    {
        CGFloat y=_currentpanview.frame.origin.y;
        CGFloat x=_currentpanview.frame.origin.x;
        
        if(y>(_containerview.frame.size.height-_currentpanview.frame.size.height))
        {
            POPBasicAnimation *anti=[POPBasicAnimation animationWithPropertyNamed:kPOPLayerPosition];
            anti.toValue=[NSValue valueWithCGPoint:CGPointMake(x+20,_containerview.frame.size.height-50)];
            
            anti.duration = 3;
            [_currentpanview.layer pop_addAnimation:anti forKey:@"shufflgin"];
            
            
        }
    }
}





@end
