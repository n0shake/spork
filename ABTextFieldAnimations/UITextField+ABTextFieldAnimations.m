//
//  UITextField+ABTextFieldAnimations.m
//  ABTextFieldAnimations
//
//  Created by Abhishek on 20/07/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import "UITextField+ABTextFieldAnimations.h"

@implementation UITextField (ABTextFieldAnimations)

/*
 Difference between CAKeyFrameAnimation and CABasicAnimation
 
 CAKeyFrameAnimation                     CABasicAnimation
 
 Changes a property through            Changes a property (eg: opacity)
 a series of values which            from a start value to an end value
 we need to define through
 values propert
 */

-(void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    
    self.borderStyle = UITextBorderStyleRoundedRect;
}

- (void)shake
{
    [self shakeWithIncrement:20 andTimeDuration:0.3 andCompletionBlock:^{
        NSLog(@"Completion Block");
    }];
}

- (void)shakeWithIncrement:(float)increment andTimeDuration:(CFTimeInterval)duration andCompletionBlock:(void(^)())completionBlock
{
    /*The property of the textfield to be animated. Here, we are animating the x-axis of the textfield*/
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];
    
    animation.values = @[ @0, [NSNumber numberWithFloat:increment], [NSNumber numberWithFloat:-increment], [NSNumber numberWithFloat:increment], @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = duration;
    
    /*When YES, the value first adds to the render tree to change the visual appearance, and then does the actual animation.*/
    /*When NO, it goes till some negative value of x of superview and then animates*/
    animation.additive = YES;
    
    [self.layer addAnimation:animation forKey:@"shake"];
    
    completionBlock();
}

- (void)bounce
{
    [self bounceWithDistance:10 andTimeDuration:0.4];
}

- (void)bounceWithDistance:(float)increment andTimeDuration:(CFTimeInterval)duration
{
    /*The property of the textfield to be animated. Here, we are animating the y-axis of the textfield*/
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
    
    /*Animates to*/
    animation.values = @[@0, [NSNumber numberWithFloat:increment], [NSNumber numberWithFloat:-increment], [NSNumber numberWithFloat:increment], @0 ];
    
    /*Should be floating numbers between 0.0 and 1.0. This defines the time point at which to apply keyframe values*/
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    
    /*Duration of keyframe animation object*/
    animation.duration = duration;
    
    /*When YES, the value first adds to the render tree to change the visual appearance, and then does the actual animation.*/
    /*When NO, it goes till some negative value of y of superview and then animates*/
    animation.additive = YES;
    
    [self.layer addAnimation:animation forKey:@"bounce"];
    
    /*Explicity change y axis if the final value in animation.values array is not zero
     self.layer.frame = CGRectMake(self.layer.frame.origin.x, self.layer.frame.origin.y - 40, self.layer.frame.size.width, self.layer.frame.size.height);*/
}

/*Fade to black animation
 -- Explicit animation - Explicitly changing value of opacity in the end
 */

- (void)animateOpacity
{
    [self animateOpacityToValue:0.0 fromValue:1.0];
}

- (void)removeOpacity
{
    [self animateOpacityToValue:1.0 fromValue:0.0];
}

- (void)animateOpacityToValue:(float)value fromValue:(float)fromValue
{
    CABasicAnimation* fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    /*Its important to define both fromValue; it does pick up current value but animation yields unexpected results*/
    fadeAnim.fromValue = [NSNumber numberWithFloat:fromValue];
    
    fadeAnim.toValue = [NSNumber numberWithFloat:value];
    
    fadeAnim.duration = 1.0;
    
    [self.layer addAnimation:fadeAnim forKey:@"opacity"];
    
    /*Here, at the end, CoreAnimation removes the animation object and redraws the layer using the value param. Hence, for the change to be permanent, we must update the layer's opacity property as follows*/
    self.layer.opacity = value;
}

/*Changes reflected immediately for layer properties. Animation takes place in the next update cycle.
 
 The next update cycle depends on the current run loop. See NSRunLoop class
 
 */
- (void)performImplicitTransparencyAnimation
{
    self.layer.opacity = 0.0;
}

/*
 - (void)textFieldDidBeginEditing:(UITextField *)textField
 {
 [self movePlaceholderText:textField];
 }
 
 - (void)textFieldDidEndEditing:(UITextField *)textField
 {
 [self removePlaceholder:textField];
 }
 
 - (void)movePlaceholderText:(UITextField *)textField
 {
 self.placeholderLabel = nil;
 self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(textField.frame.origin.x, textField.frame.origin.y, 200, 40)];
 self.placeholderLabel.font = [UIFont fontWithName: @"HelveticaNeue" size: 10.0];
 self.placeholderLabel.text = textField.placeholder;
 self.placeholderLabel.textColor = [UIColor blueColor];
 
 [textField.superview addSubview:self.placeholderLabel];
 textField.placeholder = @"";
 
 CGFloat firstPosition = textField.frame.origin.x - 10;
 //    CGFloat secondPosition = textField.frame.origin.x - 12;
 CGFloat thirdPosition = textField.frame.origin.x - 20;
 //    CGFloat fourthPosition = textField.frame.origin.x - 24;
 CGFloat fifthPosition = textField.frame.origin.x - 30;
 
 /*The property of the textfield to be animated. Here, we are animating the y-axis of the textfield
 CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];
 
 /*Animates to
 //    animation.values = @[[NSNumber numberWithFloat:firstPosition], [NSNumber numberWithFloat:secondPosition], [NSNumber numberWithFloat:thirdPosition],[NSNumber numberWithFloat:fourthPosition], [NSNumber numberWithFloat:fifthPosition] ];
 
 animation.values = @[[NSNumber numberWithFloat:firstPosition],[NSNumber numberWithFloat:thirdPosition], [NSNumber numberWithFloat:fifthPosition]];
 
 /*Should be floating numbers between 0.0 and 1.0. This defines the time point at which to apply keyframe values
 //    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
 
 animation.keyTimes = @[@0, @(1/2.0), @1];
 
 /*Duration of keyframe animation object
 animation.duration = 0.2;
 
 /*When YES, the value first adds to the render tree to change the visual appearance, and then does the actual animation.
 /*When NO, it goes till some negative value of y of superview and then animates
 animation.additive = YES;
 
 [self.placeholderLabel.layer addAnimation:animation forKey:@"moving"];
 
 self.placeholderLabel.frame = CGRectMake(textField.frame.origin.x+5, textField.frame.origin.y - 30, 200, 40);
 
 if (textField.editing)
 {
 NSLog(@"Editing mode");
 }
 else
 {
 NSLog(@"Not in editing mode");
 }
 
 }
 
 -(BOOL)textFieldShouldBeginEditing:(UITextField *)textField
 {
 return YES;
 }
 
 - (void)removePlaceholder:(UITextField *)textField
 {
 textField.placeholder = self.placeholderLabel.text;
 [self.placeholderLabel removeFromSuperview];
 }
 
 */

- (IBAction)textDidChange:(id)sender
{
    UITextField *textField = (UITextField *)sender;
    
    NSLog(@"Text:%@", textField.text);
}


@end
