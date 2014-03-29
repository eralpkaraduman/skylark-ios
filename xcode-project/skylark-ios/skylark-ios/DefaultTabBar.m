//
//  DefaultTabBar.m
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "DefaultTabBar.h"
#define tabHeight 45

@implementation DefaultTabBar

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        [self setClipsToBounds:YES];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    
    CGRect layerFrame = self.frame;
    CGFloat d = layerFrame.size.height - tabHeight;
    layerFrame.size.height = tabHeight;
    layerFrame.origin.y+=d;
    self.frame = layerFrame;
}

@end
