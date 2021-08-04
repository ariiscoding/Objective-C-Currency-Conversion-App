//
//  ViewController.m
//  Objective C Currency Conversion App
//
//  Created by Ari He on 8/1/21.
//

#import "ViewController.h"
#import "CurrencyInputViewController.h"
#import "CurrencyOutputViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// MARK: - Properties
CurrencyInputViewController *_inputViewController;
UIButton *_convertButton;
CurrencyOutputViewController *_outputViewController;


// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    [self setUpViews];
    [self setUpConstraints];
}

// MARK: - View Setups

- (void)setUpViews {
    [self setUpInputView];
    [self setUpConvertButton];
    [self setUpOutputViewController];
}

- (void)setUpInputView {
    _inputViewController = [CurrencyInputViewController new];
    
    [self.view addSubview:_inputViewController.view];
}

- (void)setUpConvertButton {
    _convertButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_convertButton setTitle:@"Convert" forState:UIControlStateNormal];
    
    [self.view addSubview:_convertButton];
}

- (void)setUpOutputViewController {
    _outputViewController = [CurrencyOutputViewController new];
    
    [self.view addSubview:_outputViewController.view];
    
    [_convertButton addTarget:self action:@selector(didClickConvert) forControlEvents:UIControlEventTouchUpInside];
}



// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpInputViewConstraints];
    [self setUpConvertButtonConstraints];
    [self setUpOutputViewConstraints];
}

- (void)setUpInputViewConstraints {
    UIView *view = _inputViewController.view;
    
    [view setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    
    // Bottom
//    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];

    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:centerX, top, leading, trailing, height, nil];
    
    [self.view addConstraints: constraints];
}

- (void)setUpConvertButtonConstraints {
    [_convertButton setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_convertButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_inputViewController.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_convertButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:_convertButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects: top, centerX, height, nil];
    [self.view addConstraints:constraints];
}

- (void)setUpOutputViewConstraints {
    UIView *outputView = _outputViewController.view;
    
    [outputView setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    CGFloat horizontalSpacing = 30;
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:outputView attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_convertButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    
    // Bottom
//    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:outputView attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:50];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:outputView attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:400];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:outputView attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:horizontalSpacing];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:outputView attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:-horizontalSpacing];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:top, height, leading, trailing, nil];
    [self.view addConstraints: constraints];
}


// MARK: - Helper Methods

- (void)didClickConvert {
    double usd = [_inputViewController getCurrentDoubleValue];
    
    [_outputViewController setDollarValueTo:usd];
}

@end
