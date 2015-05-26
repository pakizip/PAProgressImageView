#PAProgressImageView
===================


## DESCRIPTION ##

* A simple progress view for iOS that fills in image silhouettes and text with color.

## WHAT CAN I CUSTOMIZE ##

1. Direction of Progress View 
2. Progress Tint Color
2. Track Tint Color

## SETUP ##

1. Add PAProgressImageView.h and PAProgressImageView.m to your iOS XCode project.
2. Import PAProgressImageView.h into the class file where you want to use PAProgressImageView.

    <pre>#import "PAProgressImageView.h"</pre>


## CUSTOMIZABLE PROPERTIES ##

DGTextField contains the following functions:

@property (nonatomic, assign) PAProgressImageViewDirection direction;
@property(nonatomic, assign) CGFloat progress;
@property(nonatomic, copy) UIColor *progressTintColor;
@property(nonatomic, copy) UIColor *trackTintColor;
@property (nonatomic, assign) BOOL reverseMode;

## INSTANCE METHODS ##

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;
- (instancetype)initWithImage:(UIImage*)image;
- (instancetype)initWithText:(NSString *)text font:(UIFont*)font;

## LICENSE ##

The MIT License

Copyright (c) 2015 Pasquale Ambrosini   
EMAIL: pasquale.ambrosini@gmail.com   
WEBSITE: http://www.pasqualeambrosini.net   

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

