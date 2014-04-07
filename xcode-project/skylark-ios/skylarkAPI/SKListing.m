//
//  SKlisting.m
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "SKListing.h"
#import "SKListingMedia.h"

@implementation SKListing

-(id)initWithAttributes:(NSDictionary*)attributes{
    self = [super init];
    if(self){
        self.listingId = [[attributes valueForKeyPath:@"id"] unsignedIntegerValue];
        self.media = [[SKListingMedia alloc] initWithAttributes:[attributes valueForKeyPath:@"media"]];
    }
    return self;
}

+(AFHTTPRequestOperation *)exploreListingsWithOffset:(NSUInteger)offset withBlock:(void (^)(NSArray *listings, NSError *error, NSNumber *next_offset))block{
   
    NSDictionary *parameters = @{@"offset":[NSNumber numberWithUnsignedInteger:offset]};
    
    return [[SKClient sharedInstance] GET:@"/explore" parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(block){
            
            NSArray *data = [responseObject valueForKeyPath:@"data"];
            NSMutableArray *m_listings = [[NSMutableArray alloc] init];
            for(NSDictionary *attributes in data){
                SKListing *listing = [[SKListing alloc] initWithAttributes:attributes];
                [m_listings addObject:listing];
            }
            
            NSNumber *next_offset = [responseObject valueForKeyPath:@"pagination.next_offset"];
            
            block([NSArray arrayWithArray:m_listings],nil,next_offset);
        }
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        if(block){
            block([NSArray array],error,nil);
        }
        
    }];

}
@end
