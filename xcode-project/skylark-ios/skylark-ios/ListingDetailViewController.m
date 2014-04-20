//
//  ListingDetailViewController.m
//  skylark-ios
//
//  Created by eralp on 13/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "ListingDetailViewController.h"
#import "GalleryViewController.h"
#import "FlatButton.h"

@interface ListingDetailViewController ()
@property AFHTTPRequestOperation *operation;
@property GalleryViewController *gallery;
@property (nonatomic,assign) BOOL dataShouldReload;
@property IBOutlet NSLayoutConstraint *galleryHeightConstraint;
@property (strong,nonatomic) IBOutlet UISegmentedControl *segmentedControl;
@property (nonatomic,strong) IBOutlet UIScrollView *scrollView;
@property (nonatomic,strong) IBOutlet NSLayoutConstraint *galleryTopSpaceConstraint;
@property (strong,nonatomic) SegmentedViewController *segmentedContent;
@property (strong, nonatomic) IBOutlet FlatButton *likeButton;


@property (strong,nonatomic) IBOutlet NSLayoutConstraint *productInfoSegmentsHeightConstraint;

@end

@implementation ListingDetailViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dataShouldReload = YES;
    }
    return self;
}

- (IBAction)onTappedLike:(id)sender {
    [self.likeButton setActive:!self.likeButton.active];
}


-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    
    self.scrollView.delegate = self;
    
    if(self.dataShouldReload){
        [self reloadData];
    }
    
}

-(void)reloadData{
    [self.gallery reload];
    
    [self.operation cancel];
    self.operation = [self.listing loadDetailsWithBlock:^(NSError *error) {
        if(error == nil){
            self.dataShouldReload = NO;
            
            if(self.listing.media.auto_res.count != self.gallery.media.auto_res.count){
                self.gallery.media = self.listing.media;
                [self.gallery reload];
            }
            
        }else{
            #warning TODO: implement displaying network error
        }
    }];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{

    if(self.gallery){
        CGRect galleryFrame = self.scrollView.bounds;
        galleryFrame.size.height = MAX(340 - scrollView.contentOffset.y,340);
        galleryFrame.origin.y = MIN(scrollView.contentOffset.y,0);
        self.gallery.view.frame = galleryFrame;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"embedGallery"]){
    
        self.gallery = (GalleryViewController*)segue.destinationViewController;
        self.gallery.media = self.listing.media;
        self.gallery.heightConstraint = self.galleryHeightConstraint;
    
    }else if([segue.identifier isEqualToString:@"embedSegmentedContent"]){
        
        self.segmentedContent = (SegmentedViewController*)segue.destinationViewController;
        self.segmentedContent.heightConstraint = self.productInfoSegmentsHeightConstraint;
        self.segmentedContent.delegate = self;
        
    }
}

-(void)segmentedViewController:(NSObject *)segmentedViewController didShowViewController:(UIViewController *)viewController{
    
    [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:500.0f initialSpringVelocity:0 options:6<<16 | UIViewAnimationOptionBeginFromCurrentState animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.operation cancel];
}

@end
