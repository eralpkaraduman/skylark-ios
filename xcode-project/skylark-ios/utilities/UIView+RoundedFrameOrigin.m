//
//  UIView+RoundedFrameOrigin.m
//  CevapTV_iPad
//
//  Created by eralp on 1/2/14.
//  Copyright (c) 2014 Publik. All rights reserved.
//

#import "UIView+RoundedFrameOrigin.h"

@implementation UIView (RoundedFrameOrigin)


-(void)setFrameByRounding:(CGRect)_frame inParentView:(UIView*)_parentView{
    //self.frame = _frame;
    CGRect winRect = [_parentView convertRect:_frame toView:_parentView.window];
    

    
    winRect.origin.x = roundf(winRect.origin.x);
    winRect.origin.y = roundf(winRect.origin.y);
    winRect.size.width = roundf(winRect.size.width);
    winRect.size.height = roundf(winRect.size.height);
    
    
    CGRect _b =  [_parentView convertRect:winRect fromView:_parentView.window];
    
    self.frame = _b;
}

-(void)roundFrame{
    /*
    CGRect _frame = self.frame;
    CGRect winRect = [_parentView convertRect:_frame toView:_parentView.window];
    
    
    
    winRect.origin.x = roundf(winRect.origin.x);
    winRect.origin.y = roundf(winRect.origin.y);
    winRect.size.width = roundf(winRect.size.width);
    winRect.size.height = roundf(winRect.size.height);
    
    NSLog(@"r %@",NSStringFromCGRect(winRect));
    
    CGRect _b =  [_parentView convertRect:winRect fromView:_parentView.window];
    
    self.frame = _b;
    */
    
    CGRect r = self.frame;
    
    r.origin.x = roundf(r.origin.x);
    r.origin.y = roundf(r.origin.y);
    r.size.width = roundf(r.size.width);
    r.size.height = roundf(r.size.height);
    
    self.frame = r;
}

-(void)ceilFrame{
    
    CGRect r = self.frame;
    
    r.origin.x = ceilf(r.origin.x);
    r.origin.y = ceilf(r.origin.y);
    r.size.width = ceilf(r.size.width);
    r.size.height = ceilf(r.size.height);
    
    self.frame = r;
}

-(void)floorFrame{
    
    CGRect r = self.frame;
    
    r.origin.x = floorf(r.origin.x);
    r.origin.y = floorf(r.origin.y);
    r.size.width = floorf(r.size.width);
    r.size.height = floorf(r.size.height);
    
    self.frame = r;
}

@end
