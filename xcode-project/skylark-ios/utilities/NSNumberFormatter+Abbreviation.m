//
//  NSNumberFormatter+Abbreviation.m
//  adphorus2
//
//  Created by eralp on 1/27/14.
//  Copyright (c) 2014 Publik. All rights reserved.
//

#import "NSNumberFormatter+Abbreviation.h"

@implementation NSNumberFormatter (Abbreviation)

+(NSString*)abbreviatedStringFromNumber:(NSNumber*)number withCurrencyCode:(NSString*)currencyCode{

    NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
    
    [formatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    formatter.locale = [NSLocale localeWithLocaleIdentifier:@"en_US"];
    
    formatter.currencyCode = currencyCode;
    
    NSArray *abbrevations = [NSArray arrayWithObjects:@"K", @"M", @"B", @"T", nil] ;
    NSString *stringValue = nil;

    double doubleValue = [number doubleValue];
    
    if(doubleValue<1000.0){
        stringValue = [formatter stringFromNumber:number];
        //stringValue = [stringValue stringByReplacingOccurrencesOfString:@" " withString:@""];
        return stringValue;
    }
    
    for (NSString *s in abbrevations)
    {
        
        doubleValue /= 1000.0 ;
        
        if ( doubleValue < 1000.0 )
        {
            
            if ( (long long)doubleValue % (long long) 100 == 0 ) {
                [formatter setMaximumFractionDigits:0];
            } else {
                [formatter setMaximumFractionDigits:2];
            }
            
            stringValue = [NSString stringWithFormat: @"%@", [formatter stringFromNumber: [NSNumber numberWithDouble: doubleValue]] ];
            NSUInteger stringLen = [stringValue length];
            
            if ( [stringValue hasSuffix:@".00"] )
            {
                
                stringValue = [stringValue substringWithRange: NSMakeRange(0, stringLen-3)];
            } else if ( [stringValue hasSuffix:@".0"] ) {
                
                stringValue = [stringValue substringWithRange: NSMakeRange(0, stringLen-2)];
                
            } else if ( [stringValue hasSuffix:@"0"] ) {
                
                stringValue = [stringValue substringWithRange: NSMakeRange(0, stringLen-1)];
            }
            
            stringValue = [stringValue stringByAppendingString: s];
            
            break ;
        }   
    }
    


    
    return stringValue;
}

@end
