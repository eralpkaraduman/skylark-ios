//
//  GalleryItemView.h
//  skylark-ios
//
//  Created by eralp on 13/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+AFNetworking.h"
#import "UIProgressView+AFNetworking.h"

@interface GalleryItemView : UIView
@property (strong,nonatomic) UIImageView *imageView;
@property (strong,nonatomic) UIProgressView *progressView;
- (id)initWithFrame:(CGRect)frame imageURL:(NSURL*)imageURL;
-(void)load;
-(void)destroy;
@end
