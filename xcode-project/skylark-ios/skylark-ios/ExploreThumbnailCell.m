//
//  ExploreThumbnailCell.m
//  skylark-ios
//
//  Created by eralp on 30/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "ExploreThumbnailCell.h"
#import "UIImageView+AFNetworking.h"
#import "UIImage+Color.h"

#define placeholderColor [UIColor colorWithWhite:0.97f alpha:1]

@implementation ExploreThumbnailCell

static UIImage *placeholder = nil;

-(void)updateWithListing:(SKListing*)listing{
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        placeholder = [UIImage imageWithColor:placeholderColor];
    });
    
    [self.contentView setBackgroundColor:placeholderColor];

    NSURLRequest *request = [NSURLRequest requestWithURL:listing.media.thumbnailURL];
    
    __weak ExploreThumbnailCell *weak_self = self;
    [self.imageView setImageWithURLRequest:request placeholderImage:placeholder success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        
        [weak_self.imageView setAlpha:0];
        [weak_self.imageView setImage:image];
        [UIView animateWithDuration:0.3 animations:^{
            [weak_self.imageView setAlpha:1];
        }];
        
    } failure:nil];
    
}


@end
