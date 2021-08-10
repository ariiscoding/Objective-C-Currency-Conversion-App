//
//  ViewController.m
//  Objective C Currency Conversion App
//
//  Created by Ari He on 8/1/21.
//

#import "ViewController.h"
#import "CurrencyInputViewController.h"
#import "CurrencyOutputViewController.h"
#import "CurrencyConverter.h"

@interface ViewController ()

@end

@implementation ViewController

// MARK: - Properties
CurrencyInputViewController *_inputViewController;
UIButton *_convertButton;
CurrencyOutputViewController *_outputViewController;
UILabel *currencyOutputLabel;

CurrencyConverter *converter;


// MARK: - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:UIColor.whiteColor];
    
    [self setUpViews];
    [self setUpConstraints];
    
    converter = [CurrencyConverter new];
}

// MARK: - View Setups

- (void)setUpViews {
    [self setUpInputView];
    [self setUpConvertButton];
//    [self setUpOutputViewController];
    [self setUpCurrencyOutputLabel];
}

- (void)setUpInputView {
    _inputViewController = [CurrencyInputViewController new];
    
    [self.view addSubview:_inputViewController.view];
}

- (void)setUpConvertButton {
    _convertButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_convertButton setTitle:@"Convert" forState:UIControlStateNormal];
    
    [_convertButton addTarget:self action:@selector(didClickConvert) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_convertButton];
}

- (void)setUpOutputViewController {
    _outputViewController = [CurrencyOutputViewController new];
    
    [self.view addSubview:_outputViewController.view];
    
    [_convertButton addTarget:self action:@selector(didClickConvert) forControlEvents:UIControlEventTouchUpInside];
}

- (void)setUpCurrencyOutputLabel {
    currencyOutputLabel = [UILabel new];
    
    [self.view addSubview:currencyOutputLabel];
    
    [currencyOutputLabel setText:@"Add a value in usd to begin"];
    [currencyOutputLabel setNumberOfLines:0];
}


// MARK: - Constraints

- (void)setUpConstraints {
    [self setUpInputViewConstraints];
    [self setUpConvertButtonConstraints];
//    [self setUpOutputViewConstraints];
    [self setUpOutputLabelConstraints];
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

- (void)setUpOutputLabelConstraints {
    [currencyOutputLabel setTranslatesAutoresizingMaskIntoConstraints:FALSE];
    
    // Top
    NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:currencyOutputLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:_convertButton attribute:NSLayoutAttributeBottom multiplier:1.0 constant:30];
    
    // Height
    NSLayoutConstraint *height = [NSLayoutConstraint constraintWithItem:currencyOutputLabel attribute:NSLayoutAttributeHeight relatedBy:NSLayoutRelationLessThanOrEqual toItem:nil attribute:NSLayoutAttributeNotAnAttribute multiplier:1.0 constant:500];
    
    // Leading
    NSLayoutConstraint *leading = [NSLayoutConstraint constraintWithItem:currencyOutputLabel attribute:NSLayoutAttributeLeading relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeLeading multiplier:1.0 constant:50];
    
    // Trailing
    NSLayoutConstraint *trailing = [NSLayoutConstraint constraintWithItem:currencyOutputLabel attribute:NSLayoutAttributeTrailing relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self.view attribute:NSLayoutAttributeTrailing multiplier:1.0 constant:50];
    
    // Activation
    NSArray *constraints = [NSArray arrayWithObjects:top, leading, trailing, height, nil];
    
    [self.view addConstraints:constraints];
}


// MARK: - Helper Methods

- (void)didClickConvert {
    double usd = [_inputViewController getCurrentDoubleValue];
    
//    [_outputViewController setDollarValueTo:usd];
    
    NSLog(@"Conversion starts");
    
    [converter convertUsd:usd completion:^(NSDictionary *output) {
        [self finishConversion:output];
    }];
}

- (void)finishConversion: (NSDictionary*)output {
    dispatch_async(dispatch_get_main_queue(), ^{
        NSMutableString *outputString = [NSMutableString new];
        
        [outputString appendString:[self getValueForKey:@"chf" dictionary:output]];
        [outputString appendString:[self getValueForKey:@"gbp" dictionary:output]];
        [outputString appendString:[self getValueForKey:@"eur" dictionary:output]];
        
        [currencyOutputLabel setText: outputString];
        
        NSLog(@"Setting text to %@", outputString);
    });
}

- (NSString*)getValueForKey:(NSString*)key dictionary: (NSDictionary*)dictionary {
    if ([dictionary valueForKey:key] != nil) {
        NSNumber *number = [dictionary valueForKey:key];
        
        return [NSString stringWithFormat:@"%@: %@ %@", key, [self round:number], @"\n"];
    } else {
        return @"";
    }
}

- (NSString*)round: (NSNumber*)number {
    NSNumberFormatter *formatter = [NSNumberFormatter new];
    
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    
    return [formatter stringFromNumber:number];
}


@end
