//
//  Paperanimation.m
//  POPDemo
//
//  Created by mobikasa on 4/21/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "Paperanimation.h"

@interface Paperanimation ()<POPAnimationDelegate>
@property (strong, nonatomic) IBOutlet UIView *topleftvw;
@property (strong, nonatomic) IBOutlet UIView *toprightvw;
@property (strong, nonatomic) IBOutlet UIView *centrevw;
@property (strong, nonatomic) IBOutlet UIView *leftvw;
@property (strong, nonatomic)NSMutableArray *viewarray;
@property (strong, nonatomic) IBOutlet UIButton *buttton2;

@end

@implementation Paperanimation




- (void)viewDidLoad {
    [super viewDidLoad];
       


    // Do any additional setup after loading the view.
    
    

}
- (IBAction)shuffle:(id)sender {
    
    
//    
//            POPSpringAnimation *anime=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
//            anime.toValue=[NSValue valueWithCGPoint:CGPointMake(34.f ,96.f)];
//            [_topleftvw.layer pop_addAnimation:anime forKey:@"backtonormal"];
//            POPSpringAnimation *anime2=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
//            anime2.toValue=[NSValue valueWithCGPoint:CGPointMake(214.f, 121.f)];
//            [_toprightvw.layer pop_addAnimation:anime2 forKey:@"backrttonormal"];
//            POPSpringAnimation *anime3=[POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
//            anime.toValue=[NSValue valueWithCGPoint:CGPointMake(54.f, 414.f)];
//            [_leftvw pop_addAnimation:anime3 forKey:@"backtorrnormal"];
    
    
   
    
}

- (IBAction)paperbundle:(id)sender {
  
    UIButton *button=sender;
    
    POPSpringAnimation *anm=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerSize];
    anm.toValue=[NSValue valueWithCGPoint:CGPointMake(0.8, 0.8)];
    anm.delegate=self;
    [button.layer pop_addAnimation:anm forKey:@"pop"];
    
    
    [self animateview:_topleftvw];

    [self animateview:_leftvw];
       [self animateview:_toprightvw];
   
   
  
    
   
//   
//        POPSpringAnimation *anime=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
//        anime.toValue=[NSValue valueWithCGPoint:CGPointMake(34.f ,96.f)];
//        [_topleftvw.layer pop_addAnimation:anime forKey:@"backtonormal"];
//        POPSpringAnimation *anime2=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerBounds];
//        anime2.toValue=[NSValue valueWithCGPoint:CGPointMake(214.f, 121.f)];
//        [_toprightvw.layer pop_addAnimation:anime2 forKey:@"backrttonormal"];
//        POPSpringAnimation *anime3=[POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
//        anime.toValue=[NSValue valueWithCGPoint:CGPointMake(54.f, 414.f)];
//        [_leftvw pop_addAnimation:anime3 forKey:@"backtorrnormal"];
//    



    
}



-(void)animateview:(UIView*)view
{
      POPSpringAnimation *anime=[POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    anime.toValue=[NSValue valueWithCGPoint:self.view.center];
    [view pop_addAnimation:anime forKey:@"shuffling"];
    
    
    
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
