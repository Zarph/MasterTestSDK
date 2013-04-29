//
//  RMFacebookSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 29/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMFacebookSDK.h"

static NSString * const kClientBaseURL = @"https://graph.facebook.com/";

@implementation RMFacebookSDK

+ (RMFacebookSDK *)sharedClient {
    static RMFacebookSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        _sharedClient = [[RMFacebookSDK alloc] initWithBaseURL:[NSURL URLWithString:kClientBaseURL]];
        
    });
    
    return _sharedClient;
}

-(void)authenticateApp{
    
    NSString *path = [NSString stringWithFormat:@"%@oauth/access_token", kClientBaseURL];
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"client_id", @"", @"client_secret", @"client_credentials", @"grant_type", nil];

    [self getPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        NSLog(@"ResponseObject : %@", responseObject);
        NSError *jsonError;
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingAllowFragments error:&jsonError];
        NSLog(@"DATA : %@", data);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        
    }];
    
    
   /* NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://graph.facebook.com/oauth/access_token?client_id=%@&client_secret=%@&grant_type=%@", @"", @"", @"client_credentials"]];
    
    NSLog(@"%@", url);
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSLog(@"YEP");
        //NSLog(@"IP Address: %@", [JSON valueForKeyPath:@"origin"]);
    } failure:nil];
    
    [operation start];*/
    
}

/*
- (id)init
{
    self = [super init];
    if (self) {
        _accountStore = [[ACAccountStore alloc] init];
    }
    return self;
}

- (BOOL)userHasAccessToFacebook
{
    return [SLComposeViewController isAvailableForServiceType:SLServiceTypeFacebook];
}

-(void)getBaseMethodWith:(NSString *)resourcePath AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject<FacebookDelegate> *)delegate {
    //  Step 0: Check that the user has local Twitter accounts
    if ([self userHasAccessToFacebook]) {
        
        //  Step 1:  Obtain access to the user's Twitter accounts
        ACAccountType *facebookAccountType = [self.accountStore
                                             accountTypeWithAccountTypeIdentifier:
                                             ACAccountTypeIdentifierFacebook];
        
        // Specify App ID and permissions
        NSDictionary *options = @{
                                  ACFacebookAppIdKey: @"012345678912345",
                                  ACFacebookPermissionsKey: @[@"publish_stream", @"publish_actions"],
                                  ACFacebookAudeinceKey: ACFacebookAudienceFriends
                                  };
        
        [self.accountStore
         requestAccessToAccountsWithType:facebookAccountType
         options:options
         completion:^(BOOL granted, NSError *error) {
             if (granted) {
                 //  Step 2:  Create a request
                 NSArray *twitterAccounts =
                 [self.accountStore accountsWithAccountType:twitterAccountType];
                 NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@""]];
                 SLRequest *request =
                 [SLRequest requestForServiceType:SLServiceTypeFacebook
                                    requestMethod:SLRequestMethodGET
                                              URL:url
                                       parameters:params];
                 
                 //  Attach an account to the request
                 request.account = self.facebookAccount;
                 
                 //  Step 3:  Execute the request
                 [request performRequestWithHandler:^(NSData *responseData,
                                                      NSHTTPURLResponse *urlResponse,
                                                      NSError *error) {
                     if (responseData) {
                         if (urlResponse.statusCode >= 200 && urlResponse.statusCode < 300) {
                             NSError *jsonError;
                             NSDictionary *timelineData =
                             [NSJSONSerialization
                              JSONObjectWithData:responseData
                              options:NSJSONReadingAllowFragments error:&jsonError];
                             
                             if (timelineData) {
                                 NSLog(@" Response: %@\n", timelineData);
                                 
                                 
                                 //CALL THE DELEGATE METHOD
                             }
                             else {
                                 // Our JSON deserialization went awry
                                 NSLog(@"JSON Error: %@", [jsonError localizedDescription]);
                             }
                         }
                         else {
                             // The server did not respond successfully... were we rate-limited?
                             NSLog(@"The response status code is %d", urlResponse.statusCode);
                         }
                     }
                 }];
             }
             else {
                 // Access was not granted, or an error occurred
                 NSLog(@"%@", [error localizedDescription]);
             }
         }];
    }
    
}

*/

@end
