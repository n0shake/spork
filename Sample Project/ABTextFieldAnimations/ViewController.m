//
//  ViewController.m
//  ABTextFieldAnimations
//
//  Created by Abhishek Banthia on 04/06/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+ABTextFieldAnimations.h"
#import <QuartzCore/QuartzCore.h>



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.shakeField setTextAlignment:NSTextAlignmentLeft];
    [self.shakeField addTarget:self action:@selector(editingChanged) forControlEvents:UIControlEventEditingChanged];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void) editingChanged
{
    [self.shakeField sizeToFit];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shakeAction:(id)sender
{
    [self.shakeField shakeWithCompletionHandler:^{
        NSLog(@"Completion Block");
    }];
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
        [self.shakeField animateOpacityToValue:1.0f];
         [button setTitle:@"Transparent" forState:UIControlStateNormal];
    }
    else
    {
        [self.shakeField animateOpacityToValue:0];
        [button setTitle:@"Go Back" forState:UIControlStateNormal];
    }

}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}


- (IBAction)implicitAnimation:(id)sender
{
//    if ([[sender titleForState:UIControlStateNormal] isEqualToString:@"Go Back"])
//    {
//        [self.shakeField removeOpacity];
//        [sender setTitle:@"Transparent" forState:UIControlStateNormal];
//    }
//    else
//    {
//        [self.shakeField performImplicitTransparencyAnimation];
//        [sender setTitle:@"Go Back" forState:UIControlStateNormal];
//    }

    [self.shakeField replaceTextWithAnimationType:TypeReveal andDuration:2.0 andReplacementText:@"New text with reveal animation" andCompletionHandler:nil];
    
    [self.shakeField animateReplacementWithText:@"42 for life!"];
    
   [self.shakeField replaceTextWithAnimationType:TypeReveal andDuration:0.3 andReplacementText:@"Funny how its turned out" andCompletionHandler:^{
       NSLog(@"Code block to be executed on completion");
   }];
}

- (void) createAnotherShakingField
{
}

- (IBAction)textDidChange:(id)sender
{
    UITextField *textField = (UITextField *)sender;
    
    NSLog(@"Text:%@", textField.text);
}


@end
