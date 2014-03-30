//
//  SKClient.m
//  skylark-ios
//
//  Created by eralp on 29/03/14.
//  Copyright (c) 2014 eralpkaraduman. All rights reserved.
//

#import "SKClient.h"

@implementation SKClient

static SKClient *_sharedClient = nil;

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        [SKClient create];
    });
    
    return _sharedClient;
}

+(void)create{
    NSURL *baseURL = [NSURL URLWithString:@"http://skylark-replicator.eralp.in/"];
    _sharedClient = [SKClient clientWithBaseURL:baseURL clientID:@"client_id" secret:@"client_secret"];
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
