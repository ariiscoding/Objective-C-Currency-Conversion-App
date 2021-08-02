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
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeTop multiplier:1.0 constant:200];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects: centerX, top, nil];
    
    [self.view addConstraints: constraints];
}


// MARK: - Helper Methods

@end
