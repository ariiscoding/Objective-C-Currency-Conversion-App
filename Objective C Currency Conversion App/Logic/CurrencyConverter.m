//
//  CurrencyConverter.m
//  Objective C Currency Conversion App
//
//  Created by Ari He on 8/3/21.
//

#import "CurrencyConverter.h"

@implementation CurrencyConverter

// MARK: - Properties

CRCurrencyRequest *req;
CRCurrencyResults *conversionRates;

// MARK: - Initialization
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self sendRequest];
    }
    return self;
}

// MARK: - Intents

- (void)convertUsd: (double)usd completion: (void (^_Nonnull) (NSDictionary*))completion {
    self.currentUsd = [[NSNumber alloc] initWithDouble:usd];
    self.pendingConversion = completion;
    
    [self finishConversion];
}

// MARK: - Helper Methods

/// Start loading conversion rates.
- (void)sendRequest {
    
    if (conversionRates == nil) {
        req = [CRCurrencyRequest new];
        req.delegate = self;
        [req start];
    }
}

- (void)finishConversion {
    if (req == nil) {
        [self sendRequest];
        return;
    }
    
    else if (_currentUsd == nil) return;
    
    NSNumber *chf = [[NSNumber alloc] initWithDouble:conversionRates.CHF * _currentUsd.doubleValue];
    NSNumber *eur = [[NSNumber alloc] initWithDouble:conversionRates.EUR * _currentUsd.doubleValue];
    NSNumber *gbp = [[NSNumber alloc] initWithDouble:conversionRates.GBP * _currentUsd.doubleValue];
    
    NSDictionary* output = [NSDictionary dictionaryWithObjects:[NSArray arrayWithObjects:chf, eur, gbp, nil] forKeys:[NSArray arrayWithObjects:@"chf", @"eur", @"gbp", nil]];
    
    if (_pendingConversion != nil) {
        self.pendingConversion(output);
    }
}


// MARK: - CRCurrencyRequestDelegate
- (void)currencyRequest:(CRCurrencyRequest *)req retrievedCurrencies:(CRCurrencyResults *)currencies {
    conversionRates = currencies;
    
    [self finishConversion];
}

@end
