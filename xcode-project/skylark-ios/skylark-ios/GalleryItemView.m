//
//  GalleryItemView.m
//  skylark-ios
//
//  Created by eralp on 13/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "GalleryItemView.h"

@interface GalleryItemView(){
    
}
@property (strong,nonatomic) NSURL *imageURL;
@property (assign,nonatomic) BOOL canLoad;
@end

@implementation GalleryItemView

- (id)initWithFrame:(CGRect)frame imageURL:(NSURL*)imageURL
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self setAutoresizesSubviews:YES];
        
        self.progressView = [[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault];
        CGRect progressRect = self.bounds;
        progressRect.origin.x = 60;
        progressRect.size.width-= progressRect.origin.x*2;
        self.progressView.frame = progressRect;
        self.progressView.center = self.center;
        [self.progressView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin];
        
        [self.progressView setTintColor:[UIColor colorWithHex:0xff8DB1BF]];
        [self.progressView setTrackTintColor:[UIColor colorWithWhite:0.85 alpha:1]];
        
        [self.progressView setProgress:0];
        [self addSubview:self.progressView];
        
        
        self.imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.imageView setAutoresizingMask:UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth];
        [self.imageView setContentMode:UIViewContentModeScaleAspectFill];
        [self addSubview:self.imageView];

        self.imageURL = imageURL;
        
        
        
        self.canLoad = YES;
        
    }
    return self;
}

-(void)load{
    
    if(self.canLoad == NO)return;
    
    [self.imageView setImage:nil];
    [self.progressView setProgress:0];

    __weak GalleryItemView *weakSelf = self;
    self.canLoad = NO;
    //[weakSelf.imageView setAlpha:0];
    
    AFHTTPRequestOperation *operation = [self.imageView setImageWithURLRequest:[NSURLRequest requestWithURL:self.imageURL] placeholderImage:nil success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
         weakSelf.canLoad = NO;
        
        [weakSelf.imageView setAlpha:0];
        [weakSelf.imageView setImage:image];
        
        [UIView animateKeyframesWithDuration:0.2 delay:0 options:0 animations:^{
            [weakSelf.imageView setAlpha:1];
        } completion:nil];
        
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
         weakSelf.canLoad = YES;
    }];
    
    if(operation!=nil){
        [self.progressView setProgressWithDownloadProgressOfOperation:operation animated:NO];
    }
    [self setNeedsDisplay];
    
    
}

-(void)destroy{
    [self.imageView cancelImageRequestOperation];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
