//
//  PAProgressImageView.m
//  PAProgressImageViewTest
//
//  Created by Paki Ambrosini on 01/12/14.
//  Copyright (c) 2014 Pasquale Ambrosini. All rights reserved.
//
#define PAProgressViewDefaultColor [UIColor lightGrayColor]
#define PATrackViewDefaultColor [UIColor whiteColor]
#import "PAProgressImageView.h"

@interface PAProgressImageView ()

@property (nonatomic, weak) UIView *_containerView;
@property (nonatomic, weak) UIView *_trackView;
@property (nonatomic, weak) UIView *_progressView;

@end

@implementation PAProgressImageView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    
    if (self) {
        self.frame = CGRectMake(0, 0, image.size.width, image.size.height);
        [self setInitialStyleWithImage:image];
        
    }
    return self;
}


- (instancetype)initWithText:(NSString *)text font:(UIFont *)font
{

    CGSize size = [text sizeWithAttributes:@{NSFontAttributeName : font}];
    UIImage *image = [PAProgressImageView imageFromText:text withFont:font size:size color:[UIColor blackColor]];
    self = [self initWithImage:image];
    if (self) {
        
    }
    
    return self;
}

- (void)setInitialStyleWithImage:(UIImage*)image
{
    CGSize size = image.size;
    UIView *containerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    containerView.backgroundColor = [UIColor clearColor];
    [self addSubview:containerView];
    __containerView = containerView;
    
    UIView *trackView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    trackView.backgroundColor = PATrackViewDefaultColor;

    UIView *progressView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, size.width, size.height)];
    progressView.backgroundColor = PAProgressViewDefaultColor;
    
    [__containerView addSubview:trackView];
    [trackView addSubview:progressView];
    
    __trackView = trackView;
    __progressView = progressView;
    
    self.backgroundColor = [UIColor clearColor];
    
    CALayer* maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(0, 0, image.size.width , image.size.height);
    maskLayer.contents = (__bridge id)image.CGImage;
    __trackView.layer.mask = maskLayer;
    __trackView.clipsToBounds = YES;
    __trackView.layer.masksToBounds = YES;
    
    _direction = PAProgressImageViewDirectionHorizontal;
}

- (void)setTrackTintColor:(UIColor *)trackTintColor
{
    _trackTintColor = trackTintColor;
    __trackView.backgroundColor = _trackTintColor;
}

- (void)setProgressTintColor:(UIColor *)progressTintColor
{
    _progressTintColor = progressTintColor;
    __progressView.backgroundColor = _progressTintColor;
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    __progressView.frame = [self progressFrameFromProgress:progress];
}

- (void)setProgress:(CGFloat)progress animated:(BOOL)animated
{
    CGFloat value = progress;
    if (value > 1.0f) {
        value = 1.0f;
    }else if (value < 0.0f) {
        value = 0.0f;
    }
    
    if (animated) {
        _progress = value;
        [UIView animateWithDuration:0.4f animations:^{
            __progressView.frame = [self progressFrameFromProgress:value];
        }];
    }else{
        [self setProgress:value];
    }
}

- (CGRect)progressFrameFromProgress:(CGFloat)progress
{
    CGFloat value = progress;
    if (value > 1.0f) {
        value = 1.0f;
    }else if (value < 0.0f) {
        value = 0.0f;
    }
    
    CGSize containerSize = __containerView.frame.size;
    
    if (!_reverseMode) {
        if (_direction == PAProgressImageViewDirectionHorizontal) {
            return CGRectMake(0, 0, containerSize.width * value, containerSize.height);
        }else if (_direction == PAProgressImageViewDirectionVertical) {
            return CGRectMake(0, containerSize.height * (1 - value), containerSize.width, containerSize.height * value);
        }
    }else{
        if (_direction == PAProgressImageViewDirectionHorizontal) {
            return CGRectMake(containerSize.width * (1 - value), 0, containerSize.width * value, containerSize.height);
        }else if (_direction == PAProgressImageViewDirectionVertical) {
            return CGRectMake(0, 0, containerSize.width, containerSize.height * value);
        }
    }
    
    return CGRectMake(0, 0, __containerView.frame.size.width * value, __containerView.frame.size.height);
}


+ (UIImage *)imageFromText:(NSString *)text withFont:(UIFont*)font size:(CGSize)size color:(UIColor*)color
{
    
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    [text drawAtPoint:CGPointZero withAttributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName : color}];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

/*#if TARGET_INTERFACE_BUILDER
- (void)drawRect:(CGRect)rect
{
    CGRect frame = self.bounds;

    [self.maskImage drawInRect:frame];
    UIRectFrame(frame);
}
#endif*/



@end
