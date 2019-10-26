//
//  ButtonAnimation.m
//  POPDemo
//
//  Created by mobikasa on 4/21/16.
//  Copyright © 2016 AppCoda. All rights reserved.
//

#import "ButtonAnimation.h"
#import "POP.h"
@interface ButtonAnimation ()
@property (strong, nonatomic) IBOutlet UIButton *verifybtn;
@property (strong, nonatomic) IBOutlet UITextField *pass;
@property (strong, nonatomic) IBOutlet UILabel *error;

@end

@implementation ButtonAnimation



- (void)viewDidLoad {
    [super viewDidLoad];
    _pass.delegate=self;
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)verifypass:(id)sender {
    
    UIButton *buttn=sender;
    _error.hidden=NO;

    POPSpringAnimation *sprintAnimation=[POPSpringAnimation animationWithPropertyNamed:kPOPLayerPositionX];
    sprintAnimation.springBounciness = 20.f;
    
    sprintAnimation.velocity=@(3000);
       [_pass.layer pop_addAnimation:sprintAnimation forKey:@"buttonspring"];
    
    [self AnimationForlabel];
    
      POPSpringAnimation *sprintAnimatin=[POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
    buttn.layer.cornerRadius=buttn.bounds.size.height/2;
    sprintAnimatin.toValue=[NSValue valueWithCGRect:CGRectMake(self.view.center.x-(buttn.bounds.size.height)/2,self.view.center.y-(buttn.bounds.size.height)/2 ,buttn.bounds.size.height , buttn.bounds.size.height)];
   // sprintAnimatin.springBounciness=20.f;
    [buttn pop_addAnimation:sprintAnimatin forKey:@"bubblebuttn"];
    
    

}

-(void)AnimationForlabel
{
//    _error.text=@"wrong??";
//    _error.textColor=[UIColor blueColor];
    [_pass resignFirstResponder];
    POPSpringAnimation *animate=[POPSpringAnimation animationWithPropertyNamed:kPOPViewBounds];
    animate.toValue=[NSValue valueWithCGRect:CGRectMake(0 , 0, _error.bounds.size.width*8, _error.bounds.size.height)];
    _error.text=@"its a wrong password";
    _error.textColor=[UIColor redColor];
    animate.springSpeed=33.f;

  //  animate.velocity=[NSValue valueWithCGPoint:CGPointMake(5, 4)];
    
    //animate.springBounciness=40.f;
    [_error pop_addAnimation:animate forKey:@"labelspring"];
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
 //[_pass resignFirstResponder];
    _error.hidden=YES;
    
    
    return YES;
    
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
