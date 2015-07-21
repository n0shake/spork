//
//  UITextField+ABTextFieldAnimations.h
//  ABTextFieldAnimations
//
//  Created by Abhishek on 20/07/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  Different Animation Values
 */

typedef enum : NSUInteger {
    TypePush,
    TypeFade,
    TypeReveal,
    TypeMoveIn,
    TypeFromLeft,
    TypeFromRight,
    TypeFromTop,
    TypeFromBottom
} ABAnimationType;

@interface UITextField (ABTextFieldAnimations)

/**
 *  Shakes a UITextField with default params
 */

- (void)shake;

/**
 *  Shakes a UITextField and executes a block on shake completion
 *
 *  @param completionHandler A block object which is called after shake
 */
- (void)shakeWithCompletionHandler:(void(^)())completionHandler;

/**
 *  Bounce a UITextField with default params
 */

- (void)bounce;

/**
 *  Bounces a UITextField and executes a block on bounce completion
 *
 *  @param completionHandler A block object which is called after bounce
 */
- (void)bounceWithCompletionHandler:(void(^)())completionHandler;

/**
 *  Animates textfield opacity between params mentioned
 *
 *  @param value Final Opacity Value
 */

- (void)animateOpacityToValue:(float)value;

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
 *  @param completionHandler A block object to be executed
 */
- (void)replaceTextWithAnimationType:(ABAnimationType)animationType andDuration:(CFTimeInterval)duration andReplacementText:(NSString *)replacementText andCompletionHandler:(void(^)())completionHandler;

@end
