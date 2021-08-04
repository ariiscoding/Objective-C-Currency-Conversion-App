//
//  CurrencyConverter.h
//  Objective C Currency Conversion App
//
//  Created by Ari He on 8/3/21.
//

#ifndef CurrencyConverter_h
#define CurrencyConverter_h

#import <Foundation/Foundation.h>
#import <CurrencyRequest/CRCurrencyRequest.h>
#import <CurrencyRequest/CRCurrencyResults.h>

@interface CurrencyConverter : NSObject <CRCurrencyRequestDelegate>

@property (nonatomic, copy, nullable) void (^pendingConversion)(NSDictionary* _Nullable output);
@property (nonatomic, copy, nullable) NSNumber *currentUsd;


- (void)convertUsd: (double)usd completion: (void (^_Nonnull) (NSDictionary*))completion;

@end

#endif /* CurrencyConverter_h */
