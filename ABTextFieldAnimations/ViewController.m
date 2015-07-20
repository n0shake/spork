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
    
    UITextField *textField = [[UITextField alloc] init];
    [textField shake];
    
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
        [self.shakeField animateOpacity];
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

    [self createAnotherShakingField];
}

- (void) createAnotherShakingField
{
    ShakingField *newField = [[ShakingField alloc] initWithFrame:CGRectMake(self.view.frame.size.width/2 - 150, 400, 300, 30)];
    newField.delegate = newField;
    newField.placeholder = @"New Field";
    [self.view addSubview:newField];
}

- (IBAction)textDidChange:(id)sender
{
    UITextField *textField = (UITextField *)sender;
    
    NSLog(@"Text:%@", textField.text);
}


@end
