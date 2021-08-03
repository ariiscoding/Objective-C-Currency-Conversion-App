//
//  CurrencyOutputViewController.m
//  CurrencyOutputViewController
//
//  Created by Ari He on 8/1/21.
//

#import "CurrencyOutputViewController.h"
#import "CurrencyOutputLineItemViewController.h"

@implementation CurrencyOutputViewController

// MARK: - Properties

CurrencyOutputLineItemViewController *_cnyLine;
CurrencyOutputLineItemViewController *_gbpLine;
CurrencyOutputLineItemViewController *_eurLine;

UIStackView *_verticalStack;



// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubviews];
    [self setUpConstraints];
}

// MARK: - View Setups

- (void)setUpSubviews {
    [self setUpVerticalStack];
    
    [self setUpCnyLine];
    [self setUpGbpLine];
    [self setUpEurLine];
    
    [_cnyLine setCurrencyType:@"Chinese Yuan"];
    [_gbpLine setCurrencyType:@"British Pound"];
    [_eurLine setCurrencyType:@"Euro"];
}

- (void)setUpVerticalStack {
    _verticalStack = [UIStackView new];
    [_verticalStack setAxis:UILayoutConstraintAxisVertical];
    
    [_verticalStack setSpacing:30];
    [_verticalStack setDistribution:UIStackViewDistributionFillEqually];
    
    [self.view addSubview:_verticalStack];
}

- (void)setUpCnyLine {
    _cnyLine = [CurrencyOutputLineItemViewController new];
    [_cnyLine setCurrencyType:@"Chinese Yuan"];
    [_cnyLine.view setBackgroundColor:UIColor.yellowColor];
    
    [_verticalStack addArrangedSubview:_cnyLine.view];
}

- (void)setUpGbpLine {
    _gbpLine = [CurrencyOutputLineItemViewController new];
    [_gbpLine setCurrencyType:@"British Pound"];
    [_gbpLine.view setBackgroundColor:UIColor.blueColor];
    
    [_verticalStack addArrangedSubview:_gbpLine.view];
}

- (void)setUpEurLine {
    _eurLine = [CurrencyOutputLineItemViewController new];
    [_eurLine setCurrencyType:@"Euro"];
    [_eurLine.view setBackgroundColor:UIColor.greenColor];
    
    [_verticalStack addArrangedSubview:_eurLine.view];
}


// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpVerticalStackConstraints];
//    [self setConstraintsForAllLines];
}

- (void)setUpVerticalStackConstraints {
    [_verticalStack setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:_verticalStack attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    // Bottom
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:_verticalStack attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:_verticalStack attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:_verticalStack attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:top, bottom, leading, trailing, nil];
    [self.view addConstraints:constraints];
}

- (void)setConstraintForLineItem: (CurrencyOutputLineItemViewController*) line {
    UIView *view = line.view;
    UIView *parent = view.superview;
    
    if (parent == NULL) return;
    
    [view setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Top
//    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
    
    // Bottom
//    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    [view addConstraint:height];
    
    // Width
    NSLayoutConstraint *width = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeWidth relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:400];
    
    [view addConstraint:width];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:leading, trailing, nil];
    [parent addConstraints:constraints];
}

- (void)setConstraintsForAllLines {
    [self setConstraintForLineItem:_cnyLine];
    [self setConstraintForLineItem:_gbpLine];
    [self setConstraintForLineItem:_eurLine];
}


// MARK: - Intents

- (void)setDollarValueTo:(double)newValue {
    // TODO: Implement
}


// MARK: - Helper Methods


@end
