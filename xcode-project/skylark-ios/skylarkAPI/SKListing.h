//
//  SKlisting.h
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SKListingMedia.h"
#import "SKClient.h"

@interface SKListing : NSObject
@property (nonatomic,assign) NSUInteger listingId;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) SKListingMedia *media;
-(id)initWithAttributes:(NSDictionary*)attributes;
+(AFHTTPRequestOperation *)exploreListingsWithOffset:(NSUInteger)offset withBlock:(void (^)(NSArray *listings, NSError *error, NSNumber *next_offset))block;
-(AFHTTPRequestOperation *)loadDetailsWithBlock:(void (^)(NSError *error))block;
@end
