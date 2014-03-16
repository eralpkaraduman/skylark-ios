//
//  NSNumberFormatter+Abbreviation.h
//  adphorus2
//
//  Created by eralp on 1/27/14.
//  Copyright (c) 2014 Publik. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSNumberFormatter (Abbreviation)

+(NSString*)abbreviatedStringFromNumber:(NSNumber*)number withCurrencyCode:(NSString*)currencyCode;

@end
