//
//  FlatButton.m
//  skylark-ios
//
//  Created by eralp on 20/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "FlatButton.h"

@interface FlatButton(){
    
}
@property (strong,nonatomic) UIColor *activeBackgroundColor;
@end

@implementation FlatButton



-(void)awakeFromNib{
    [super awakeFromNib];
    
    self.activeBackgroundColor = self.backgroundColor;
    [self updateAttributesAsActive:self.active];
}

-(void)updateAttributesAsActive:(BOOL)active{
    
    self.layer.cornerRadius = 3;
    self.layer.borderWidth = self.borderThickness;
    
    if(self.imageView.image){
        UIImage* imageForRendering = [self.imageView.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        self.imageView.image = imageForRendering;
    }
    
    if(active == YES){
        self.layer.borderColor = self.borderColor.CGColor;
        self.imageView.tintColor = self.imageTintColor;
        self.backgroundColor = self.activeBackgroundColor;
    }else{
        self.layer.borderColor = self.inactiveBorderColor.CGColor;
        self.imageView.tintColor = self.imageInactiveTintColor;
        self.backgroundColor = self.inactiveBackgroundColor;
    }
    
    if(self.clearBackground){
        self.backgroundColor = [UIColor clearColor];
    }
    
}

-(void)toggleActive:(BOOL)active{
    self.active = active;
    [self updateAttributesAsActive:active];
    
}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    
    BOOL active = NO;
    
    if(self.active && highlighted){
        active = NO;
    }
    
    if(self.active && !highlighted){
        active = YES;
    }
    
    if(!self.active && highlighted){
        active = YES;
    }
    
    if(!self.active && !highlighted){
        active = NO;
    }
    
    [self updateAttributesAsActive:active];
    
}



@end
