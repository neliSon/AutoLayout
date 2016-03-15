//
//  LPAViewController.m
//  Autolayout
//
//  Created by Steven Masuch on 2014-07-20.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPAViewController.h"

@interface LPAViewController ()

@property (nonatomic, weak) UIButton *  squareButton;
@property (nonatomic, weak) UIButton *  portraitButton;
@property (nonatomic, weak) UIButton *  landscapeButton;

@property (nonatomic, weak) UIView *                framingView, *purpleView, *redView, *orangeViewLeft, *orangeViewRight, *blueViewTop, *blueViewMid, *blueViewBot;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewHeight;
@property (nonatomic, weak) NSLayoutConstraint *    framingViewWidth;

@end

@implementation LPAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIButton *squareButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [squareButton setTitle:@"Square" forState:UIControlStateNormal];
    [squareButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:squareButton];
    squareButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.squareButton = squareButton;
    
    UIButton *portraitButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [portraitButton setTitle:@"Portrait" forState:UIControlStateNormal];
    [portraitButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:portraitButton];
    portraitButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.portraitButton = portraitButton;
    
    UIButton *landscapeButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [landscapeButton setTitle:@"Landscape" forState:UIControlStateNormal];
    [landscapeButton addTarget:self action:@selector(resizeFramingView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:landscapeButton];
    landscapeButton.translatesAutoresizingMaskIntoConstraints = NO;
    self.landscapeButton = landscapeButton;
    
    UIView *framingView = [[UIView alloc] initWithFrame:CGRectZero];
    framingView.translatesAutoresizingMaskIntoConstraints = NO;
    framingView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:framingView];
    self.framingView = framingView;

    
    NSString *buttonsHorizontalConstraints = @"|[squareButton(==portraitButton)][portraitButton(==landscapeButton)][landscapeButton]|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:buttonsHorizontalConstraints
                                                                      options:NSLayoutFormatAlignAllCenterY
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(squareButton, portraitButton, landscapeButton)]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:squareButton
                                                          attribute:NSLayoutAttributeBottom
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeBottom
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:framingView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:-50.0]];
    
    NSLayoutConstraint *framingViewHeight = [NSLayoutConstraint constraintWithItem:framingView
                                                                         attribute:NSLayoutAttributeHeight
                                                                         relatedBy:NSLayoutRelationEqual
                                                                            toItem:nil
                                                                         attribute:NSLayoutAttributeNotAnAttribute
                                                                        multiplier:1.0
                                                                          constant:500.0];
    
    NSLayoutConstraint *framingViewWidth = [NSLayoutConstraint constraintWithItem:framingView
                                                                        attribute:NSLayoutAttributeWidth
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:nil
                                                                        attribute:NSLayoutAttributeNotAnAttribute
                                                                       multiplier:1.0
                                                                         constant:500.0];
    
    [framingView addConstraint:framingViewHeight];
    [framingView addConstraint:framingViewWidth];
    
    self.framingViewHeight = framingViewHeight;
    self.framingViewWidth = framingViewWidth;
    
    
    // Set up your views and constraints here
    
    // purpleBox

    UIView *purpleView = [[UIView alloc] initWithFrame:CGRectZero];
    purpleView.translatesAutoresizingMaskIntoConstraints = NO;
    purpleView.backgroundColor = [UIColor purpleColor];
    [self.framingView addSubview:purpleView];
    self.purpleView = purpleView;
    
    NSLayoutConstraint *purpleViewRight = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *purpleViewBottom = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *purpleViewWidth = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeWidth multiplier:305.0/500.0 constant:0];

    NSLayoutConstraint *purpleViewHeight = [NSLayoutConstraint constraintWithItem:purpleView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    [self.framingView addConstraints:@[purpleViewRight, purpleViewBottom, purpleViewWidth, purpleViewHeight]];

    // redBox
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectZero];
    redView.translatesAutoresizingMaskIntoConstraints = NO;
    redView.backgroundColor = [UIColor redColor];
    [self.framingView addSubview:redView];
    self.redView = redView;
    
    NSLayoutConstraint *redViewRight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-20.0];
    
    NSLayoutConstraint *redViewTop = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeTop multiplier:1.0 constant:20.0];
    
    NSLayoutConstraint *redViewWidth = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:144.0];
    
    NSLayoutConstraint *redViewHeight = [NSLayoutConstraint constraintWithItem:redView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:46.0];
    
    [self.framingView addConstraints:@[redViewRight, redViewTop, redViewWidth, redViewHeight]];
    
    // orangeBox1 && orangeBox2
    
    // orangeBoxLeft
    UIView *orangeViewLeft = [[UIView alloc] initWithFrame:CGRectZero];
    orangeViewLeft.translatesAutoresizingMaskIntoConstraints = NO;
    orangeViewLeft.backgroundColor = [UIColor orangeColor];
    [self.redView addSubview:orangeViewLeft];
    self.orangeViewLeft = orangeViewLeft;
    
    NSLayoutConstraint *orangeViewLeftLeft = [NSLayoutConstraint constraintWithItem:orangeViewLeft attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeLeftMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *orangeViewLeftTop = [NSLayoutConstraint constraintWithItem:orangeViewLeft attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *orangeViewLeftWidth = [NSLayoutConstraint constraintWithItem:orangeViewLeft attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:70.0];
    
    NSLayoutConstraint *orangeViewLeftHeight = [NSLayoutConstraint constraintWithItem:orangeViewLeft attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.redView addConstraints:@[orangeViewLeftLeft, orangeViewLeftTop, orangeViewLeftWidth, orangeViewLeftHeight]];
    
    // orangeBoxRight
    UIView *orangeViewRight = [[UIView alloc] initWithFrame:CGRectZero];
    orangeViewRight.translatesAutoresizingMaskIntoConstraints = NO;
    orangeViewRight.backgroundColor = [UIColor orangeColor];
    [self.redView addSubview:orangeViewRight];
    self.orangeViewRight = orangeViewRight;
    
    NSLayoutConstraint *orangeViewRightRight = [NSLayoutConstraint constraintWithItem:orangeViewRight attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeRightMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *orangeViewRightTop = [NSLayoutConstraint constraintWithItem:orangeViewRight attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:redView attribute:NSLayoutAttributeTopMargin multiplier:1.0 constant:0];
    
    NSLayoutConstraint *orangeViewRightWidth = [NSLayoutConstraint constraintWithItem:orangeViewRight attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *orangeViewRightHeight = [NSLayoutConstraint constraintWithItem:orangeViewRight attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30.0];
    
    [self.redView addConstraints:@[orangeViewRightRight, orangeViewRightTop, orangeViewRightWidth, orangeViewRightHeight]];
    
    // blueBoxes
    
    // blueBoxMid
    UIView *blueViewMid = [[UIView alloc] initWithFrame:CGRectZero];
    blueViewMid.translatesAutoresizingMaskIntoConstraints = NO;
    blueViewMid.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueViewMid];
    self.blueViewMid = blueViewMid;
    
    NSLayoutConstraint *blueViewMidCenterX = [NSLayoutConstraint constraintWithItem:blueViewMid attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
        
    NSLayoutConstraint *blueViewMidCenterY = [NSLayoutConstraint constraintWithItem:blueViewMid attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    NSLayoutConstraint *blueViewMidWidth = [NSLayoutConstraint constraintWithItem:blueViewMid attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueViewMidHeight = [NSLayoutConstraint constraintWithItem:blueViewMid attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];

    [self.framingView addConstraints:@[blueViewMidCenterX, blueViewMidCenterY, blueViewMidWidth, blueViewMidHeight]];
    
    // blueBoxTop
    UIView *blueViewTop = [[UIView alloc] initWithFrame:CGRectZero];
    blueViewTop.translatesAutoresizingMaskIntoConstraints = NO;
    blueViewTop.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueViewTop];
    self.blueViewTop = blueViewTop;
    
    NSLayoutConstraint *blueViewTopCenterX = [NSLayoutConstraint constraintWithItem:blueViewTop attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *blueViewTopCenterY = [NSLayoutConstraint constraintWithItem:blueViewTop attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:0.5 constant:0];
    
    NSLayoutConstraint *blueViewTopWidth = [NSLayoutConstraint constraintWithItem:blueViewTop attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueViewTopHeight = [NSLayoutConstraint constraintWithItem:blueViewTop attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    [self.framingView addConstraints:@[blueViewTopCenterX, blueViewTopCenterY, blueViewTopWidth, blueViewTopHeight]];
    
    // blueBoxBot
    UIView *blueViewBot = [[UIView alloc] initWithFrame:CGRectZero];
    blueViewBot.translatesAutoresizingMaskIntoConstraints = NO;
    blueViewBot.backgroundColor = [UIColor blueColor];
    [self.framingView addSubview:blueViewBot];
    self.blueViewBot = blueViewBot;
    
    NSLayoutConstraint *blueViewBotCenterX = [NSLayoutConstraint constraintWithItem:blueViewBot attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    NSLayoutConstraint *blueViewBotCenterY = [NSLayoutConstraint constraintWithItem:blueViewBot attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:framingView attribute:NSLayoutAttributeCenterY multiplier:1.5 constant:0];
    
    NSLayoutConstraint *blueViewBotWidth = [NSLayoutConstraint constraintWithItem:blueViewBot attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    NSLayoutConstraint *blueViewBotHeight = [NSLayoutConstraint constraintWithItem:blueViewBot attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50.0];
    
    [self.framingView addConstraints:@[blueViewBotCenterX, blueViewBotCenterY, blueViewBotWidth, blueViewBotHeight]];

}

- (void)resizeFramingView:(id)sender
{
    CGFloat newWidth = 0.0;
    CGFloat newHeight = 0.0;
    
    if (sender == self.squareButton) {
        newWidth = 500.0;
        newHeight = 500.0;
    } else if (sender == self.portraitButton) {
        newWidth = 350.0;
        newHeight = 550.0;
    } else if (sender == self.landscapeButton) {
        newWidth = 900.0;
        newHeight = 300.0;
    }
    
    [UIView animateWithDuration:2.0 animations:^(){
        self.framingViewHeight.constant = newHeight;
        self.framingViewWidth.constant = newWidth;
        [self.view layoutIfNeeded];
    }];
}

@end
