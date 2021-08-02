//
//  CurrencyOutputLineItemViewController.m
//  CurrencyOutputLineItemViewController
//
//  Created by Ari He on 8/1/21.
//

#import "CurrencyOutputLineItemViewController.h"

@implementation CurrencyOutputLineItemViewController

// MARK: - Properties
UIStackView *_horizontalStack;
UILabel *_currencyTypeLabel;
UILabel *_currencyAmountLabel;


// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubviews];
    [self setUpConstraints];
}

// MARK: - View Setups

- (void)setUpSubviews {
    [self setUpHorizontalStack];
    [self setUpCurrencyTypeLabel];
    [self setUpCurrencyAmountLabel];
}

- (void)setUpHorizontalStack {
    _horizontalStack = [UIStackView new];
    [_horizontalStack setAxis:UILayoutConstraintAxisHorizontal];
    [_horizontalStack setDistribution:UIStackViewDistributionFillEqually];
    
    [self.view addSubview:_horizontalStack];
}

- (void)setUpCurrencyTypeLabel {
    _currencyTypeLabel = [UILabel new];
    
    [_horizontalStack addArrangedSubview:_currencyTypeLabel];
}

- (void)setUpCurrencyAmountLabel {
    _currencyAmountLabel = [UILabel new];
    
    [_horizontalStack addArrangedSubview:_currencyAmountLabel];
}

// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpHorizontalStackConstraints];
}

- (void)setUpHorizontalStackConstraints {
    [_horizontalStack setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_horizontalStack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    // Bottom
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_horizontalStack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:_horizontalStack attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:_horizontalStack attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:top, bottom, leading, trailing, nil];
    [self.view addConstraints:constraints];
}

// MARK: - Intents

- (void)setCurrencyType: (NSString*)currencyType {
    _currencyTypeLabel.text = currencyType;
}

- (void)setCurrencyAmountString: (NSString*)amount {
    _currencyAmountLabel.text = amount;
}

- (void)setCurrencyAmount: (double)amount {
    NSString* amountString = [NSString stringWithFormat:@"%.02f", amount];
    
    [self setCurrencyAmountString:amountString];
}

@end
