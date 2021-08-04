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

CurrencyOutputLineItemViewController *_chfLine;
CurrencyOutputLineItemViewController *_gbpLine;
CurrencyOutputLineItemViewController *_eurLine;



// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpSubviews];
    [self setUpConstraints];
}

// MARK: - View Setups

- (void)setUpSubviews {
    // TODO: Stop using the stack
    [self setUpChfLine];
    [self setUpGbpLine];
    [self setUpEurLine];
}

- (void)setUpChfLine {
    _chfLine = [CurrencyOutputLineItemViewController new];
    
    [self.view addSubview:_chfLine.view];
    
    [_chfLine setCurrencyType:@"Swiss Franc"];
}

- (void)setUpGbpLine {
    _gbpLine = [CurrencyOutputLineItemViewController new];
    
    [self.view addSubview:_gbpLine.view];
    
    [_gbpLine setCurrencyType:@"British Pound"];
}

- (void)setUpEurLine {
    _eurLine = [CurrencyOutputLineItemViewController new];
    
    [self.view addSubview:_eurLine.view];
    
    [_eurLine setCurrencyType:@"Euro"];
}


// MARK: - Constraints

- (void)setUpConstraints {
    [self setConstraintsForAllLines];
    
    [self.view sizeToFit];
}

- (void)setConstraintForLineItem: (CurrencyOutputLineItemViewController*) line withLineOnTop: (CurrencyOutputLineItemViewController*)lineOnTop {
    UIView *view = line.view;
    UIView *parent = view.superview;
    
    if (parent == NULL) return;
    
    [view setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeTop multiplier:1.0 constant:30];
    if (lineOnTop != nil) {
        UIView *viewOnTop = lineOnTop.view;
        
        top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:viewOnTop attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    }
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationEqual toItem:parent attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:100];
    
    [view addConstraint:height];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:leading, trailing, top, nil];
    [parent addConstraints:constraints];
}

- (void)setConstraintsForAllLines {
    [self setConstraintForLineItem:_chfLine withLineOnTop:nil];
    [self setConstraintForLineItem:_gbpLine withLineOnTop:_chfLine];
    [self setConstraintForLineItem:_eurLine withLineOnTop:_gbpLine];
}


// MARK: - Intents

- (void)setDollarValueTo:(double)newValue {
    // TODO: Implement
}


// MARK: - Helper Methods


@end
