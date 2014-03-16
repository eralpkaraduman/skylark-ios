//
//  UIImage+Darken.h
//  CevapTV_iPad
//
//  Created by eralp on 7/16/13.
//  Copyright (c) 2013 Publik. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Darken)
+ (UIImage *)darkenImage:(UIImage *)image toLevel:(CGFloat)level;
@end
