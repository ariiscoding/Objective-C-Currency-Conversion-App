//
//  CurrencyOutputLineItemViewController.h
//  CurrencyOutputLineItemViewController
//
//  Created by Ari He on 8/1/21.
//

#ifndef CurrencyOutputLineItemViewController_h
#define CurrencyOutputLineItemViewController_h

#import <UIKit/UIKit.h>

@interface CurrencyOutputLineItemViewController : UIViewController

- (void)setCurrencyType: (NSString*)currencyType;

- (void)setCurrencyAmountString: (NSString*)amount;

- (void)setCurrencyAmount: (double)amount;

@end


#endif /* CurrencyOutputLineItemViewController_h */
