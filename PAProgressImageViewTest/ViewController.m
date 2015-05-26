//
//  ViewController.m
//  PAProgressImageViewTest
//
//  Created by Paki Ambrosini on 01/12/14.
//  Copyright (c) 2014 Pasquale Ambrosini. All rights reserved.
//
#import "PAProgressImageView.h"
#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIScrollView *scrollView;
@property (nonatomic, assign) CGPoint currentPoint;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:scrollView];
    _scrollView = scrollView;
    _currentPoint = CGPointMake(self.scrollView.frame.size.width * 0.5f, 0.0f);
    
    [self setupBottleAnimation];
    _currentPoint.y += _scrollView.frame.size.height;
    [self setupRomeAnimation];
    _currentPoint.y += _scrollView.frame.size.height;
    [self setupTextAnimation];
    _currentPoint.y += _scrollView.frame.size.height;
    [self setupSilhouetteAnimation];
    _currentPoint.y += _scrollView.frame.size.height;
    
    _scrollView.contentSize = CGSizeMake(_scrollView.frame.size.width, _currentPoint.y);
    _scrollView.pagingEnabled = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setupBottleAnimation
{
    PAProgressImageView *p = [[PAProgressImageView alloc] initWithImage:[UIImage imageNamed:@"Bottle.png"]];
    p.tag = 100;
    p.trackTintColor = [UIColor blackColor];
    p.progressTintColor = [UIColor colorWithRed:237./255. green:27./255. blue:36./255. alpha:1.0f];
    p.direction = PAProgressImageViewDirectionVertical;
    p.reverseMode = NO;
    p.center = CGPointMake(_currentPoint.x, _currentPoint.y + _scrollView.frame.size.height * 0.5f);
    p.progress = 0.0f;
    [_scrollView addSubview:p];
    [self addSliderForProgressView:p];
}

- (void)setupRomeAnimation
{
    PAProgressImageView *p = [[PAProgressImageView alloc] initWithImage:[UIImage imageNamed:@"Rome.png"]];
    p.tag = 101;
    p.trackTintColor = [UIColor darkGrayColor];
    p.progressTintColor = [UIColor colorWithRed:45./255. green:202./255. blue:250./255. alpha:1.0f];
    p.direction = PAProgressImageViewDirectionHorizontal;
    p.reverseMode = NO;
    p.center = CGPointMake(_currentPoint.x, _currentPoint.y + _scrollView.frame.size.height * 0.5f);
    p.progress = 0.0f;
    [_scrollView addSubview:p];
    [self addSliderForProgressView:p];
    
}

- (void)setupTextAnimation
{
    PAProgressImageView *p = [[PAProgressImageView alloc] initWithText:@"Hello, World!" font:[UIFont fontWithName:@"HelveticaNeue-Thin" size:50.0f]];
    p.tag = 102;
    p.trackTintColor = [UIColor clearColor];
    p.progressTintColor = [UIColor colorWithRed:22./255. green:156./255. blue:92./255. alpha:1.0f];
    p.direction = PAProgressImageViewDirectionHorizontal;
    p.reverseMode = NO;
    p.center = CGPointMake(_currentPoint.x, _currentPoint.y + _scrollView.frame.size.height * 0.5f);
    p.progress = 0.0f;
    [_scrollView addSubview:p];
    [self addSliderForProgressView:p];
    
}

- (void)setupSilhouetteAnimation
{
    PAProgressImageView *p = [[PAProgressImageView alloc] initWithImage:[UIImage imageNamed:@"Silhouette.png"]];
    p.tag = 103;
    p.trackTintColor = [[UIColor blackColor] colorWithAlphaComponent:0.05f];
    p.progressTintColor = [UIColor blackColor];
    p.direction = PAProgressImageViewDirectionVertical;
    p.reverseMode = YES;
    p.center = CGPointMake(_currentPoint.x, _currentPoint.y + _scrollView.frame.size.height * 0.5f);
    p.progress = 0.0f;
    [_scrollView addSubview:p];
    [self addSliderForProgressView:p];
    
}

- (void)addSliderForProgressView:(PAProgressImageView*)progressView
{
    CGFloat maxY = CGRectGetMaxY(progressView.frame);
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f, maxY + 20, self.view.frame.size.width * 0.8f, 40)];
    slider.center = CGPointMake(_scrollView.frame.size.width * 0.5f, maxY + 40);
    slider.minimumValue = 0.0f;
    slider.maximumValue = 1.0f;
    slider.tag = progressView.tag + 1000;
    slider.value = progressView.progress;
    [slider addTarget:self action:@selector(sliderDidChangeValue:) forControlEvents:UIControlEventValueChanged];
    [_scrollView addSubview:slider];
    
}


- (void)sliderDidChangeValue:(UISlider*)slider
{
    PAProgressImageView *p = (PAProgressImageView*)[self.view viewWithTag:slider.tag - 1000];
    p.progress = slider.value;
}

@end
