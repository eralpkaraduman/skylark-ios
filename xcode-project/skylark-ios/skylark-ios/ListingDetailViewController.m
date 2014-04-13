//
//  ListingDetailViewController.m
//  skylark-ios
//
//  Created by eralp on 13/04/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "ListingDetailViewController.h"
#import "GalleryViewController.h"


@interface ListingDetailViewController ()
@property AFHTTPRequestOperation *operation;
@property GalleryViewController *gallery;
@property (nonatomic,assign) BOOL dataShouldReload;
@property IBOutlet NSLayoutConstraint *galleryHeightConstraint;
@end

@implementation ListingDetailViewController

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        self.dataShouldReload = YES;
    }
    return self;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
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

/*
-(void)displayData{
    if(self.gallery!=nil){
        if(self.gallery.media.auto_res.count == 0){
            self.gallery.media = self.listing.media;
 
        }
    }
}
*/

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
    }
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    
    [self.operation cancel];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
