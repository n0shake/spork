//
//  ShakingField.h
//  ABTextFieldAnimations
//
//  Created by Abhishek Banthia on 04/06/15.
//  Copyright (c) 2015 Abhishek Banthia. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShakingField : UITextField <UITextFieldDelegate>

@property (assign) CGRect *newFrame;

- (void)shake;
- (void)bounce;
- (void)animateOpacity;
- (void)removeOpacity;
- (void)performImplicitTransparencyAnimation;

@property (strong, nonatomic) UILabel *placeholderLabel;

@end
