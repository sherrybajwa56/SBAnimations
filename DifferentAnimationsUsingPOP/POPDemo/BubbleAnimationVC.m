//
//  BubbleAnimationVC.m
//  POPDemo
//
//  Created by mobikasa on 10/5/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "BubbleAnimationVC.h"

@interface BubbleAnimationVC ()

@end

@implementation BubbleAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
//    view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
//    view.layer.cornerRadius = view.frame.size.width/2;
//    [self.view addSubview:view];
//    
//    UIView * view1 = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
//    view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
//    view.layer.cornerRadius = view1.frame.size.width/2;
//    [self.view addSubview:view1];
//    
//    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(170, 100, 50, 50)];
//    view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
//    view.layer.cornerRadius = view2.frame.size.width/2;
//    [self.view addSubview:view2];
//    
//    
//    UIView * view3 = [[UIView alloc] initWithFrame:CGRectMake(230, 100, 50, 50)];
//    view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
//    view.layer.cornerRadius = view3.frame.size.width/2;
//    [self.view addSubview:view3];
//    


    
    [self animationshook];
   
    // Do any additional setup after loading the view.
}

-(void)animationshook
{
    
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 50, 50)];
    view.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.2];
    view.layer.cornerRadius = view.frame.size.width/2;
  
    
    UIView * view2 = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 50)];
    view2.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
    view2.layer.cornerRadius = view2.frame.size.width/2;
    
    [self.view addSubview:view];
    [self.view addSubview:view2];

    
    
    //create an animation to follow a circular path
    CAKeyframeAnimation *pathAnimation2 = [CAKeyframeAnimation animationWithKeyPath:@"position2"];
    //interpolate the movement to be more smooth
    pathAnimation2.calculationMode = kCAAnimationPaced;
    //apply transformation at the end of animation (not really needed since it runs forever)
    pathAnimation2.fillMode = kCAFillModeForwards;
    pathAnimation2.removedOnCompletion = NO;
    //run forever
    pathAnimation2.repeatCount = INFINITY;
    //no ease in/out to have the same speed along the path
    pathAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation2.duration = 5.0;
    
    //The circle to follow will be inside the circleContainer frame.
    //it should be a frame around the center of your view to animate.
    //do not make it to large, a width/height of 3-4 will be enough.
    CGMutablePathRef curvedPath2 = CGPathCreateMutable();
    CGRect circleContainer2 = CGRectInset(view.frame, 23, 23);
    CGPathAddEllipseInRect(curvedPath2, NULL, circleContainer2);
    
    //add the path to the animation
    pathAnimation2.path = curvedPath2;
    //release path
    CGPathRelease(curvedPath2);
    //add animation to the view's layer
    [view2.layer addAnimation:pathAnimation2 forKey:@"myCircleAnimation2"];
    
    //create an animation to scale the width of the view
    CAKeyframeAnimation *scaleX2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x2"];
    //set the duration
    scaleX2.duration = 1;
    //it starts from scale factor 1, scales to 1.05 and back to 1
    scaleX2.values = @[@1.0, @1.05, @1.0];
    //time percentage when the values above will be reached.
    //i.e. 1.05 will be reached just as half the duration has passed.
    scaleX2.keyTimes = @[@0.0, @0.5, @1.0];
    //keep repeating
    scaleX2.repeatCount = INFINITY;
    //play animation backwards on repeat (not really needed since it scales back to 1)
    scaleX2.autoreverses = YES;
    //ease in/out animation for more natural look
    scaleX2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //add the animation to the view's layer
    [view2.layer addAnimation:scaleX2 forKey:@"scaleXAnimation2"];
    
    //create the height-scale animation just like the width one above
    //but slightly increased duration so they will not animate synchronously
    CAKeyframeAnimation *scaleY2 = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y2"];
    scaleY2.duration = 1.5;
    scaleY2.values = @[@1.0, @1.05, @1.0];
    scaleY2.keyTimes = @[@0.0, @0.5, @1.0];
    scaleY2.repeatCount = INFINITY;
    scaleY2.autoreverses = YES;
    scaleX2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view2.layer addAnimation:scaleY2 forKey:@"scaleYAnimation2"];
    
    

    
    
    
    
    

    //create an animation to follow a circular path
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    //interpolate the movement to be more smooth
    pathAnimation.calculationMode = kCAAnimationPaced;
    //apply transformation at the end of animation (not really needed since it runs forever)
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    //run forever
    pathAnimation.repeatCount = INFINITY;
    //no ease in/out to have the same speed along the path
    pathAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnimation.duration = 5.0;
    
    //The circle to follow will be inside the circleContainer frame.
    //it should be a frame around the center of your view to animate.
    //do not make it to large, a width/height of 3-4 will be enough.
    CGMutablePathRef curvedPath = CGPathCreateMutable();
    CGRect circleContainer = CGRectInset(view.frame, 23, 23);
    CGPathAddEllipseInRect(curvedPath, NULL, circleContainer);
    
    //add the path to the animation
    pathAnimation.path = curvedPath;
    //release path
    CGPathRelease(curvedPath);
    //add animation to the view's layer
    [view.layer addAnimation:pathAnimation forKey:@"myCircleAnimation"];
    
    //create an animation to scale the width of the view
    CAKeyframeAnimation *scaleX = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.x"];
    //set the duration
    scaleX.duration = 1;
    //it starts from scale factor 1, scales to 1.05 and back to 1
    scaleX.values = @[@1.0, @1.05, @1.0];
    //time percentage when the values above will be reached.
    //i.e. 1.05 will be reached just as half the duration has passed.
    scaleX.keyTimes = @[@0.0, @0.5, @1.0];
    //keep repeating
    scaleX.repeatCount = INFINITY;
    //play animation backwards on repeat (not really needed since it scales back to 1)
    scaleX.autoreverses = YES;
    //ease in/out animation for more natural look
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //add the animation to the view's layer
    [view.layer addAnimation:scaleX forKey:@"scaleXAnimation"];
    
    //create the height-scale animation just like the width one above
    //but slightly increased duration so they will not animate synchronously
    CAKeyframeAnimation *scaleY = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleY.duration = 1.5;
    scaleY.values = @[@1.0, @1.05, @1.0];
    scaleY.keyTimes = @[@0.0, @0.5, @1.0];
    scaleY.repeatCount = INFINITY;
    scaleY.autoreverses = YES;
    scaleX.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [view.layer addAnimation:scaleY forKey:@"scaleYAnimation"];
    
    
    
  
    
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
