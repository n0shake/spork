//
//  UITextField+ABTextFieldAnimations.h
//  ABTextFieldAnimations
//
//  Created by Abhishek on 20/07/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ABTextFieldAnimations)


- (void)shake;
- (void)bounce;
- (void)animateOpacity;
- (void)removeOpacity;
- (void)performImplicitTransparencyAnimation;

@end
