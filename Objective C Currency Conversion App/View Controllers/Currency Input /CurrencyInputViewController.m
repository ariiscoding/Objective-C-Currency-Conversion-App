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
UILabel *_currencyLabel;


// MARK: - Lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubviews];
    [self setUpConstraints];
}


// MARK: - View Setup

- (void)setUpSubviews {
    [self setUpHorizontalStack];
    [self setUpCurrencyInputField];
    [self setUpCurrencyLabel];
}

- (void)setUpHorizontalStack {
    _horizontalStack = [UIStackView new];
    [_horizontalStack setAxis:UILayoutConstraintAxisHorizontal];
    [_horizontalStack setSpacing:10];
    
    [self.view addSubview:_horizontalStack];
}

- (void)setUpCurrencyInputField {
    _currencyInputField = [UITextField new];
    [_currencyInputField setPlaceholder:@"Enter a value"];
    [_currencyInputField setBorderStyle:UITextBorderStyleRoundedRect];
    
    [_horizontalStack addArrangedSubview:_currencyInputField];
}

- (void)setUpCurrencyLabel {
    _currencyLabel = [UILabel new];
    [_currencyLabel setText:@"in US Dollars"];
    
    [_horizontalStack addArrangedSubview:_currencyLabel];
}

// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpHorizontalStackConstraints];
    [self setUpCurrencyInputFieldConstraints];
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

- (void)setUpCurrencyInputFieldConstraints {
    [_currencyInputField setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Width
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:_currencyInputField attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:200];
    
    [_currencyInputField addConstraint:width];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:_currencyInputField attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:30];
    
    [_currencyInputField addConstraint:height];
}

// MARK: - Intents

@end
