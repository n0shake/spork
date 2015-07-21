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

#pragma mark -
#pragma mark Shake Methods
#pragma mark -

- (void)shake
{
    [self shakeWithIncrement:20 andTimeDuration:0.3 andCompletionHandler:nil];
}

- (void)shakeWithCompletionHandler:(void(^)())completionHandler
{
    [self shakeWithIncrement:20 andTimeDuration:0.3 andCompletionHandler:completionHandler];
}

- (void)shakeWithIncrement:(float)increment andTimeDuration:(CFTimeInterval)duration andCompletionHandler:(void(^)())completionHandler
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
    
    if (completionHandler)
    {
        completionHandler();
    }
    
}

#pragma mark -
#pragma mark Bounce Methods
#pragma mark -

- (void)bounce
{
    [self bounceWithCompletionHandler:nil];
}

- (void)bounceWithCompletionHandler:(void(^)())completionHandler
{
    [self bounceWithDistance:10 andTimeDuration:0.4 andCompletionHandler:completionHandler];
}

- (void)bounceWithDistance:(float)increment andTimeDuration:(CFTimeInterval)duration andCompletionHandler:(void(^)())completionHandler
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
    
    if (completionHandler)
    {
        completionHandler();
    }
    
    
    /*Explicity change y axis if the final value in animation.values array is not zero
     self.layer.frame = CGRectMake(self.layer.frame.origin.x, self.layer.frame.origin.y - 40, self.layer.frame.size.width, self.layer.frame.size.height);*/
}

/*Fade to black animation
 -- Explicit animation - Explicitly changing value of opacity in the end
 */

- (void)animateOpacityToValue:(float)value
{
    float fromValue = self.layer.opacity;
    
    CABasicAnimation* fadeAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    
    /*Its important to define both fromValue; it does pick up current value but animation yields unexpected results*/
    fadeAnim.fromValue = [NSNumber numberWithFloat:fromValue];
    
    fadeAnim.toValue = [NSNumber numberWithFloat:value];
    
    fadeAnim.duration = 1.0;
    
    [self.layer addAnimation:fadeAnim forKey:@"opacity"];
    
    /*Here, at the end, CoreAnimation removes the animation object and redraws the layer using the value param. Hence, for the change to be permanent, we must update the layer's opacity property as follows*/
    self.layer.opacity = value;
}

#pragma mark -
#pragma mark Replacement Animation Methods
#pragma mark -

- (void)animateReplacementWithText:(NSString *)replacementText
{
    [self replaceTextWithAnimationType:TypeFade andDuration:0.5 andReplacementText:replacementText andCompletionHandler:nil];
}

- (void)animateReplacementWithText:(NSString *)replacementText withCompletionHandler:(void (^)())completionHandler
{
    [self replaceTextWithAnimationType:TypeFade andDuration:0.5 andReplacementText:replacementText andCompletionHandler:completionHandler];
}

- (void)replaceTextWithAnimationType:(ABAnimationType)animationType andDuration:(CFTimeInterval)duration andReplacementText:(NSString *)replacementText andCompletionHandler:(void(^)())completionHandler
{
    CATransition *transition = [CATransition animation];
    transition.duration = duration;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    switch (animationType) {
        case TypeReveal:
            transition.type = kCATransitionReveal;
            break;
            
        case TypePush:
            transition.type = kCATransitionPush;
            break;
            
        case TypeFade:
            transition.type = kCATransitionFade;
            break;
            
        case TypeMoveIn:
            transition.type = kCATransitionMoveIn;
            break;
            
        case TypeFromLeft:
            transition.type = kCATransitionFromLeft;
            break;
            
        case TypeFromRight:
            transition.type = kCATransitionFromRight;
            break;
            
        case TypeFromTop:
            transition.type = kCATransitionFromTop;
            break;
            
        case TypeFromBottom:
            transition.type = kCATransitionFromBottom;
            break;
            
        default:
            transition.type = kCATransitionMoveIn;
            break;
    }
    
    [self.layer addAnimation:transition forKey:@"replaceAnimation"];
    
    self.text = replacementText; // or set it in the completion block.
    
    if (completionHandler)
    {
        completionHandler();
    }
    
}

/*Changes reflected immediately for layer properties. Animation takes place in the next update cycle.
 
 The next update cycle depends on the current run loop. See NSRunLoop class
 
 */


@end
