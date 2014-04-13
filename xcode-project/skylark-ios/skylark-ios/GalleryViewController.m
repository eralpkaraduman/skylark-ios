//
//  GalleryViewController.m
//  skylark-ios
//
//  Created by eralp on 13/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "GalleryViewController.h"
#import "GalleryItemView.h"

@interface GalleryViewController (){
}

@property (strong,nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong,nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong,nonatomic) IBOutlet UIActivityIndicatorView *idleSpinner;
@property (strong,nonatomic) NSArray *items;
@property (assign,nonatomic) NSUInteger index;
@end

@implementation GalleryViewController


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}

-(void)disposeOldItems{
    
    for(GalleryItemView *item in self.items){
        [item removeFromSuperview];
        [item destroy];
    }
    self.items = [NSArray array];
    
#warning TODO: not implemented
}

-(void)reload{
    [self disposeOldItems];
    
    NSMutableArray *m_items = [NSMutableArray array];
    CGFloat frame_x = 0.0f;
    
    self.index = 0;
    for(NSURL *url in self.media.auto_res){
        
        CGRect itemFrame = self.scrollView.bounds;
        itemFrame.origin.x = frame_x;
        
        GalleryItemView *item = [[GalleryItemView alloc] initWithFrame:itemFrame imageURL:url];
        [m_items addObject:item];
        [self.scrollView addSubview:item];

        frame_x += self.scrollView.bounds.size.width;
        self.scrollView.contentSize = CGSizeMake(frame_x, self.scrollView.bounds.size.height);
        
    }
    
    self.items = [NSArray arrayWithArray:m_items];
    [self setCurrentPage:self.index];
    
    if(self.items.count<=0){
        [self.idleSpinner startAnimating];
    }else{
        [self.idleSpinner stopAnimating];
    }
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    CGFloat width = scrollView.frame.size.width;
    NSUInteger page = (scrollView.contentOffset.x + (0.5f * width)) / width;
    [self setCurrentPage:page];

}


-(void)setCurrentPage:(NSUInteger)index{
    
    index = MIN(MAX(0, (NSInteger)index), self.items.count);
    NSInteger pre_index = MIN(MAX(0, (NSInteger)index-1), MAX(self.items.count-1,0));
    NSInteger post_index = MIN(MAX(0, (NSInteger)index+1), MAX(self.items.count-1,0));
    
    if(self.items.count>0){
        [(GalleryItemView*)self.items[index] load];
        [(GalleryItemView*)self.items[post_index] load];
        [(GalleryItemView*)self.items[pre_index] load];
    }
    
    [self.pageControl setNumberOfPages:self.items.count];
    [self.pageControl setCurrentPage:index];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
