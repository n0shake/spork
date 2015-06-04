//
//  ViewController.m
//  ABTextFieldAnimations
//
//  Created by Abhishek Banthia on 04/06/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import "ViewController.h"

#import <QuartzCore/QuartzCore.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shakeAction:(id)sender
{
    [self.shakeField shake];
}

- (IBAction)bounceAction:(id)sender
{
    [self.shakeField bounce];
}

- (IBAction)animateOpacity:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
    if ([[button titleForState:UIControlStateNormal] isEqualToString:@"Go Back"])
    {
        [self.shakeField removeOpacity];
         [button setTitle:@"Transparent" forState:UIControlStateNormal];
    }
    else
    {
        [self.shakeField performImplicitTransparencyAnimation];
        [button setTitle:@"Go Back" forState:UIControlStateNormal];
    }

}

@end
