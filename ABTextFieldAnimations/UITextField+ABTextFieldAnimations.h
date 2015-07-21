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

- (void)shakeWithCompletionHandler:(void(^)())completionHandler;
- (void)bounceWithCompletionHandler:(void(^)())completionHandler;
- (void)animateOpacity;
- (void)removeOpacity;
- (void)performImplicitTransparencyAnimation;
- (void)animateReplacementWithText:(NSString *)replacementText;
- (void)animateReplacementWithText:(NSString *)replacementText withCompletionHandler:(void(^)())completionHandler;
- (void)replaceTextWithAnimationType:(TypeAnimation)animationType andDuration:(CFTimeInterval)duration andReplacementText:(NSString *)replacementText andCompletionHandler:(void(^)())completionHandler;

@end
