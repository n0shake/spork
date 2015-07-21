//
//  UITextField+ABTextFieldAnimations.h
//  ABTextFieldAnimations
//
//  Created by Abhishek on 20/07/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
     TypePush,
     TypeFade,
     TypeReveal,
     TypeMoveIn,
    TypeFromLeft,
    TypeFromRight,
    TypeFromTop,
    TypeFromBottom
} TypeAnimation;

@interface UITextField (ABTextFieldAnimations)

/**
 *  Shakes a UITextField and executes a block on shake completion
 *
 *  @param completionHandler A block object which is called after shake
 */
- (void)shakeWithCompletionHandler:(void(^)())completionHandler;

/**
 *  Bounces a UITextField and executes a block on bounce completion
 *
 *  @param completionHandler A block object which is called after bounce
 */
- (void)bounceWithCompletionHandler:(void(^)())completionHandler;

/**
 *  Animates a UITextField to zero opacity
 */
- (void)animateOpacity;

/**
 *  Animates a UITextField to full opacity
 */
- (void)removeOpacity;

/**
 *  Performs implicit animation on UITextField's opacity attribute. Same as animateOpacity method
 */
- (void)performImplicitTransparencyAnimation;

/**
 *  Reset or change UITextField's text attribute with animation
 *
 *  @param replacementText Final replacement text
 */
- (void)animateReplacementWithText:(NSString *)replacementText;

/**
 *  Reset or change UITextField's text attribute with animation. Executes a block on completion
 *
 *  @param replacementText   Final replacement text
 *  @param completionHandler A block object which is called after replacement is performed
 */

- (void)animateReplacementWithText:(NSString *)replacementText withCompletionHandler:(void(^)())completionHandler;

/**
 *  Reset or change UITextField's text attribute with animation. Customize animation types.
 *
 *  @param animationType     Type of animation to be performed. Check TypeAnimation enum for different values
 *  @param duration          Duration of animation
 *  @param replacementText   Final replacement text
 *  @param completionHandler A block object which is called after replacement is performed
 */
- (void)replaceTextWithAnimationType:(TypeAnimation)animationType andDuration:(CFTimeInterval)duration andReplacementText:(NSString *)replacementText andCompletionHandler:(void(^)())completionHandler;

@end
