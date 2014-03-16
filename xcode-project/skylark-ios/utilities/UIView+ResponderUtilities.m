//
//  UIView+UIView_ResponderUtilities.m
//  adphorus
//
//  Created by eralp on 8/26/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import "UIView+ResponderUtilities.h"

@implementation UIView (ResponderUtilities)

- (BOOL)findAndResignFirstResponder
{
    if (self.isFirstResponder) {
        [self resignFirstResponder];
        return YES;
    }
    for (UIView *subView in self.subviews) {
        if ([subView findAndResignFirstResponder])
            return YES;
    }
    return NO;
}

@end
