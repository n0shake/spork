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

- (void)shakeWithCompletionBlock:(void(^)())completionBlock;
- (void)bounceWithCompletionHandler:(void(^)())completionBlock;
- (void)animateOpacity;
- (void)removeOpacity;
- (void)performImplicitTransparencyAnimation;
- (void)replaceTextWithAnimationType:(TypeAnimation)animationType andDuration:(CFTimeInterval)duration;

@end
