//
//  ViewController.m
//  Objective C Currency Conversion App
//
//  Created by Ari He on 8/1/21.
//

#import "ViewController.h"
#import "CurrencyInputViewController.h"

@interface ViewController ()

@end

@implementation ViewController

// MARK: - Properties
CurrencyInputViewController *_inputView;
UIButton *_convertButton;


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
}

- (void)setUpInputView {
    _inputView = [CurrencyInputViewController new];
    
    [self.view addSubview:_inputView.view];
}

- (void)setUpConvertButton {
    _convertButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_convertButton setTitle:@"Convert" forState:UIControlStateNormal];
    
    [self.view addSubview:_convertButton];
}



// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpInputViewConstraints];
    [self setUpConvertButtonConstraints];
}

- (void)setUpInputViewConstraints {
    UIView *view = _inputView.view;
    
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
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_convertButton attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_inputView.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_convertButton attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:_convertButton attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects: top, centerX, height, nil];
    [self.view addConstraints:constraints];
}


// MARK: - Helper Methods

@end
