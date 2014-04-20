//
//  FlatButton.h
//  skylark-ios
//
//  Created by eralp on 20/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FlatButton : UIButton
@property (assign,nonatomic) BOOL active;
@property (assign,nonatomic) BOOL clearBackground;
@property (strong,nonatomic) UIColor *borderColor;
@property (strong,nonatomic) UIColor *inactiveBorderColor;
@property (assign,nonatomic) float borderThickness;
@property (strong,nonatomic) UIColor *imageInactiveTintColor;
@property (strong,nonatomic) UIColor *imageTintColor;
@property (strong,nonatomic) UIColor *inactiveBackgroundColor;
@end
