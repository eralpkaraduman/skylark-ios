//
//  UIView+RoundedFrameOrigin.h
//  CevapTV_iPad
//
//  Created by eralp on 1/2/14.
//  Copyright (c) 2014 Publik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (RoundedFrameOrigin)
-(void)setFrameByRounding:(CGRect)frame inParentView:(UIView*)parentView;
-(void)roundFrame;
-(void)ceilFrame;
-(void)floorFrame;
@end
