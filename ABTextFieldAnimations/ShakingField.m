//
//  ShakingField.m
//  ABTextFieldAnimations
//
//  Created by Abhishek Banthia on 04/06/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import "ShakingField.h"

@implementation ShakingField



/*
    Difference between CAKeyFrameAnimation and CABasicAnimation
 
            CAKeyFrameAnimation                     CABasicAnimation
 
        Changes a property through            Changes a property (eg: opacity)
        a series of values which            from a start value to an end value
        we need to define through 
        values propert
 */

- (void)shake
{
    /*The property of the textfield to be animated. Here, we are animating the x-axis of the textfield*/
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.x"];

    animation.values = @[ @0, @20, @-20, @20, @0 ];
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    animation.duration = 0.3;
    
    /*When YES, the value first adds to the render tree to change the visual appearance, and then does the actual animation.*/
    /*When NO, it goes till some negative value of x of superview and then animates*/
    animation.additive = YES;
    
    [self.layer addAnimation:animation forKey:@"shake"];
}

- (void)bounce
{
    /*The property of the textfield to be animated. Here, we are animating the y-axis of the textfield*/
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position.y"];

    /*Animates to*/
    animation.values = @[@0, @10, @-10, @10, @0 ];
    
    /*Should be floating numbers between 0.0 and 1.0. This defines the time point at which to apply keyframe values*/
    animation.keyTimes = @[ @0, @(1 / 6.0), @(3 / 6.0), @(5 / 6.0), @1 ];
    
    /*Duration of keyframe animation object*/
    animation.duration = 0.4;
    
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

@end
