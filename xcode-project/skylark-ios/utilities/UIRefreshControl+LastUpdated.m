//
//  UIRefreshControl+LastUpdated.m
//  adphorus2
//
//  Created by eralp on 25/02/14.
//  Copyright (c) 2014 Publik. All rights reserved.
//

#import "UIRefreshControl+LastUpdated.h"

@implementation UIRefreshControl (LastUpdated)
-(void)setLastUpdatedToNow{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setLocale:[NSLocale localeWithLocaleIdentifier:@"en_US"]];
    [dateFormatter setDateFormat:@"HH:mm:ss"];
    //[dateFormatter setDateStyle:NSDateFormatterFullStyle];
    NSString *lastUpdated = [NSString stringWithFormat:@"Last updated: %@",[dateFormatter stringFromDate:[[NSDate alloc] init]]];
    NSMutableAttributedString *a_string = [[NSMutableAttributedString alloc] initWithString:lastUpdated];
    [self setAttributedTitle:a_string];
}
@end
