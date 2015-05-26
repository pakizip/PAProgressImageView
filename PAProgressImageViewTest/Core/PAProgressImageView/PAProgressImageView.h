//
//  PAProgressImageView.h
//  PAProgressImageViewTest
//
//  Created by Paki Ambrosini on 01/12/14.
//  Copyright (c) 2014 Pasquale Ambrosini. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PAProgressImageViewDirectionVertical,
    PAProgressImageViewDirectionHorizontal
} PAProgressImageViewDirection;

@interface PAProgressImageView : UIView

@property (nonatomic, assign) PAProgressImageViewDirection direction;
@property(nonatomic, assign) CGFloat progress;
@property(nonatomic, copy) UIColor *progressTintColor;
@property(nonatomic, copy) UIColor *trackTintColor;
@property (nonatomic, assign) BOOL reverseMode;
- (void)setProgress:(CGFloat)progress animated:(BOOL)animated;

- (instancetype)initWithImage:(UIImage*)image;
- (instancetype)initWithText:(NSString *)text font:(UIFont*)font;
@end
