//
//  UIButton+HitArea.h
//  CevapTV_iPad
//
//  Created by eralp on 7/16/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import <UIKit/UIKit.h>

#define MakeNegativeIsoInsets(inset) UIEdgeInsetsMake(-inset,-inset*2,-inset,-inset)

@interface UIButton (HitArea)

@property(nonatomic, assign) UIEdgeInsets hitTestEdgeInsets;

@end
