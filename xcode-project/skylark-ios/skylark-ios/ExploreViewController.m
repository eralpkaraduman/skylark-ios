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

@interface ExploreViewController ()
@property (nonatomic,strong) NSNumber *next_offset;
@property (nonatomic,strong) NSArray *listings;
@property (nonatomic,strong) AFHTTPRequestOperation *operation;
@end

@implementation ExploreViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self reload];

}

-(void)reload{
    self.listings = [NSArray array];
    self.next_offset = [NSNumber numberWithInt:0];
    [self.collectionView reloadData];
    [self loadMore];
}

-(void)loadMore{
    
    [self.operation cancel];
    self.operation = [SKListing exploreListingsWithOffset:[self.next_offset unsignedIntegerValue] withBlock:^(NSArray *listings, NSError *error, NSNumber *next_offset) {
        
        if(error == nil){
            
            self.listings = listings;
            self.next_offset = next_offset;
            [self.collectionView reloadData];
            

            //[self.collectionView setContentInset:UIEdgeInsetsMake(-44, 0, 0, 0)];

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
    
    SKListing *listing = [self.listings objectAtIndex:indexPath.item];
    NSLog(@"listing id %i",listing.listingId);
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"%@",NSStringFromUIEdgeInsets(self.collectionView.contentInset));
    
    //NSLog(@"%f",scrollView.contentOffset.y);
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView{
    
    //NSLog(@"%f",scrollView.contentOffset.y);
    /*
    if([self.operation isExecuting] == NO){
        [self loadMore];
    }
    */
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
     static NSString *footerView = @"footerView";
    
    if (kind == UICollectionElementKindSectionFooter) {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:footerView forIndexPath:indexPath];
        
        reusableview = footerview;
        
        
        

    }
    
    return reusableview;
}





@end
