//
//  ExploreViewController.m
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "ExploreViewController.h"
#import "SKListing.h"
#import "ExploreThumbnailCell.h"
#import "UINavigationItem+Attributes.h"
#import "ListingDetailViewController.h"


@implementation FooterProgressView
@end

@interface ExploreViewController ()
@property (nonatomic,strong) NSNumber *next_offset;
@property (nonatomic,strong) NSArray *listings;
@property (nonatomic,strong) AFHTTPRequestOperation *operation;
@property (nonatomic,strong) FooterProgressView *footerProgressView;

@end

@implementation ExploreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self reload];

}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self.navigationItem addLogo];
    [self setNeedsStatusBarAppearanceUpdate];
}



-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)reload{
    self.listings = [NSArray array];
    self.next_offset = [NSNumber numberWithInt:0];
    [self.collectionView reloadData];
    //[self loadMore];
}

-(void)loadMore{
    
    [self.operation cancel];
    
    NSLog(@"no %@",self.next_offset);
    
    self.operation = [SKListing exploreListingsWithOffset:[self.next_offset unsignedIntegerValue] withBlock:^(NSArray *listings, NSError *error, NSNumber *next_offset) {
        
        if(error == nil){
            
            self.next_offset = next_offset;
            self.listings = [self.listings arrayByAddingObjectsFromArray:listings];
            [self.collectionView reloadData];
            

        }else{
            
        }
        
    }];
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.listings.count;
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *thumbanilCellIdentifier = @"thumbnailCell";
    
    ExploreThumbnailCell *cell = (ExploreThumbnailCell*)[self.collectionView dequeueReusableCellWithReuseIdentifier:thumbanilCellIdentifier forIndexPath:indexPath];
    
    SKListing *listing = [self.listings objectAtIndex:indexPath.item];

    [cell updateWithListing:listing];
    
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    [self performSegueWithIdentifier:@"pushProductDetail" sender:self];
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"pushProductDetail"]){
        NSIndexPath *selectedIndexPath = [self.collectionView indexPathsForSelectedItems][0];
        SKListing *listing = [self.listings objectAtIndex:selectedIndexPath.item];
        ListingDetailViewController *listingDetail = (ListingDetailViewController*)segue.destinationViewController;
        listingDetail.listing = listing;
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionFooter) {
        self.footerProgressView = (FooterProgressView*)[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footerView" forIndexPath:indexPath];
        reusableview = self.footerProgressView;
    }
    
    [self bottomReached];
    
    return reusableview;
}

-(void)bottomReached{
    
    if(self.next_offset!=nil && [self.operation isExecuting]==NO){
        [self.footerProgressView.activityIndicator startAnimating];
        [self loadMore];
    }else{
        [self.footerProgressView.activityIndicator stopAnimating];
    }
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    
    CGSize footerSize = self.view.bounds.size;
    
    if(self.next_offset!=nil){
        footerSize.height = 44;
    }else{
        footerSize.height = 0;
    }
    
    return footerSize;
    
    
}






@end
