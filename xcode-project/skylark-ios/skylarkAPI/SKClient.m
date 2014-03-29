//
//  SKClient.m
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "SKClient.h"

@implementation SKClient

static SKClient *SINGLETON = nil;
static bool isFirstAccess = YES;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        isFirstAccess = NO;

        NSURL *baseURL = [NSURL URLWithString:@"http://skylark-replicator.eralp.in/"];
        SINGLETON = [SKClient clientWithBaseURL:baseURL clientID:@"client_id" secret:@"client_secret"];
        
    });
    
    return SINGLETON;
}

#pragma mark - Life Cycle

+ (id) allocWithZone:(NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)copyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

+ (id)mutableCopyWithZone:(struct _NSZone *)zone
{
    return [self sharedInstance];
}

- (id)copy
{
    return [[SKClient alloc] init];
}

- (id)mutableCopy
{
    return [[SKClient alloc] init];
}

- (id) init
{
    if(SINGLETON){
        return SINGLETON;
    }
    if (isFirstAccess) {
        [self doesNotRecognizeSelector:_cmd];
    }
    self = [super init];
    return self;
}


#warning TODO: implement auth https://github.com/AFNetworking/AFOAuth2Client#example-usage
/*
 
 NSURL *url = [NSURL URLWithString:@"http://example.com/"];
 AFOAuth2Client *oauthClient = [AFOAuth2Client clientWithBaseURL:url clientID:kClientID secret:kClientSecret];
 
 [oauthClient authenticateUsingOAuthWithPath:@"/oauth/token"
 username:@"username"
 password:@"password"
 scope:@"email"
 success:^(AFOAuthCredential *credential) {
 NSLog(@"I have a token! %@", credential.accessToken);
 [AFOAuthCredential storeCredential:credential withIdentifier:oauthClient.serviceProviderIdentifier];
 }
 failure:^(NSError *error) {
 NSLog(@"Error: %@", error);
 }];
 
*/


@end
