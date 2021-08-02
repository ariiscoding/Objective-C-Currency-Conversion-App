//
//  CurrencyInputViewController.m
//  CurrencyInputViewController
//
//  Created by Ari He on 8/1/21.
//

#import "CurrencyInputViewController.h"

@implementation CurrencyInputViewController

// MARK: - Properties
UIStackView *_horizontalStack;
UITextField *_currencyInputField;


// MARK: - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubviews];
    [self setUpConstraints];
}


// MARK: - View Setup

- (void)setUpSubviews {
    [self setUpHorizontalStack];
}

- (void)setUpHorizontalStack {
    _horizontalStack = [UIStackView new];
    [_horizontalStack setAxis:UILayoutConstraintAxisHorizontal];
    
    [self.view addSubview:_horizontalStack];
    
    UILabel *tempLabel = [UILabel new];
    [tempLabel setText: @"Test Text"];
    
    [_horizontalStack addArrangedSubview:tempLabel];
}

- (void)setUpCurrencyInputField {
    
}


// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpHorizontalStackConstraints];
}

- (void)setUpHorizontalStackConstraints {
    [_horizontalStack setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:_horizontalStack attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Center Y
    NSLayoutConstraint *centerY = [NSLayoutConstraint constraintWithItem:_horizontalStack attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:centerX, centerY, nil];
    
    [self.view addConstraints:constraints];
}


// MARK: - Intents

@end
