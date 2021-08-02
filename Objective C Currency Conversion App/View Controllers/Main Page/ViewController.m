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
}

- (void)setUpInputView {
    _inputView = [CurrencyInputViewController new];
    
    [self.view addSubview:_inputView.view];
}



// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpInputViewConstraints];
}

- (void)setUpInputViewConstraints {
    UIView *view = _inputView.view;
    
    [view setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Center X
    NSLayoutConstraint *centerX = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:100];
    
    // Bottom
    NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationLessThanOrEqual toItem:self.view attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:0];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:0];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:50];

    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:centerX, top, bottom, leading, trailing, height, nil];
    
    [self.view addConstraints: constraints];
}


// MARK: - Helper Methods

@end
