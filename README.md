# ABTextFieldAnimations

[![Pod Status](https://cocoapod-badges.herokuapp.com/v/ABTextFieldAnimations/badge.png)](https://cocoapods.org/?q=ABTextFieldAnimations)

Simple CoreAnimation based animations applied on textfields!

## In Action

![Sample Animations](https://github.com/Abhishaker17/ABTextFieldAnimations/blob/master/Animations.gif)

## Setup with CocoaPods

- Add ``pod `ABTextFieldAnimations` `` to your podfile
- Run ``pod install``
- Run ``open app.xcworkspace``
- Import ``UITextField+ABTextFieldAnimations.h`` in your controller

## How to Use ABTextFieldAnimations

It's easy peasy!

	//For Shaking a UITextField With Default Params
	[self.textfield shake];
    
	//For shake with custom increment and time duration
    [self.textfield shakeWithIncrement:30 andTimeDuration:0.4 andCompletionHandler:nil];
    
	//For performing actions on shake completion with default params
	[self.textfield shakeWithCompletionHandler:^{
    	NSLog(@"Block called on completion of shake");
    }];
    
Similar methods available for Bouncing a UITextField

	- (void)bounce;
	- (void)bounceWithCompletionHandler:(void(^)())completionHandler;
    
For replacing text in UITextField with Fade Animation

	 [self.textfield animateReplacementWithText:@"42 for life!"];
     
Replacing text with a completion handler

	[self.textfield animateReplacementWithText:@"My preciousss" 	 withCompletionHandler:^{
        NSLog(@"Benoit was innocent");
    }];

Replacing text with custom animation options (Check out ABAnimationOption enum for different animation options)

	[self.shakeField replaceTextWithAnimationType:TypeReveal andDuration:0.3 andReplacementText:@"Funny how its turned out" andCompletionHandler:^{
       NSLog(@"Code block to be executed on completion");
   }];
   
Animate Opacity

	[self.shakeField animateOpacityToValue:0.5];


## The MIT License (MIT)

	Copyright (c) 2015 Abhishek Banthia

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.
