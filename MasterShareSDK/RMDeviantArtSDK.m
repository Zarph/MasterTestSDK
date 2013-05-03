//
//  RMDeviantArtSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 03/05/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMDeviantArtSDK.h"
#import "AFJSONRequestOperation.h"

static NSString * const kOAuth2BaseURLString = @"https://www.deviantart.com/oauth2/draft10/";
static NSString * const kServerAPIURL = @"https://www.deviantart.com/api/draft10/";
static NSString * const kClientIDString = @"407";
static NSString * const kClientSecretString = @"a88a42d466e0870a8805877e2ffad1e0";

@implementation RMDeviantArtSDK

+ (RMDeviantArtSDK *)sharedClient {
    static RMDeviantArtSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:kOAuth2BaseURLString];
        _sharedClient = [RMDeviantArtSDK clientWithBaseURL:url clientID:kClientIDString secret:kClientSecretString];
        
        _sharedClient.credential = [AFOAuthCredential retrieveCredentialWithIdentifier:_sharedClient.serviceProviderIdentifier];
        if (_sharedClient.credential != nil) {
            [_sharedClient setAuthorizationHeaderWithCredential:_sharedClient.credential];
        }
        
        
    });
    
    return _sharedClient;
}

-(void)authenticate {
    
    [self authenticateUsingOAuthWithPath:@"authorize" scope:nil redirectURI:@"dvntart://oauth2" success:^(AFOAuthCredential *credential) {
        
        NSLog(@"Success ? ");
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                                 scope:(NSString *)scope
                           redirectURI:(NSString *)uri
                               success:(void (^)(AFOAuthCredential *credential))success
                               failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    // [mutableParameters setObject:kAFOAuthClientCredentialsGrantType forKey:@"grant_type"];
    //[mutableParameters setValue:scope forKey:@"scope"];
    [mutableParameters setValue:uri forKey:@"redirect_uri"];
    [mutableParameters setValue:@"code" forKey:@"response_type"];
    //[mutableParameters setValue:@"authorization_code" forKey:@"grant_type"];
    //[mutableParameters setValue:kClientSecretString forKey:@"client_secret"];
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self authenticateUsingOAuthWithPath:path parameters:parameters success:success failure:failure];
}

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                            parameters:(NSDictionary *)parameters
                               success:(void (^)(AFOAuthCredential *credential))success
                               failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionaryWithDictionary:parameters];
    [mutableParameters setObject:self.clientID forKey:@"client_id"];
    //[mutableParameters setObject:self.secret forKey:@"client_secret"];
    parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self clearAuthorizationHeader];
    
    NSMutableURLRequest *mutableRequest = [self requestWithMethod:@"GET" path:path parameters:parameters];
    
    BOOL didOpenOtherApp = NO;
    
    NSLog(@"MutableWeb :%@", mutableRequest.URL);
    
    didOpenOtherApp = [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[mutableRequest.URL absoluteString]]];
    
}


- (BOOL)handleOpenURL:(NSURL *)url{
    

    NSString *query = [NSString stringWithFormat:@"%@",url];
    if (!query) {
        query = [url query];
    }
    
    self.params = [self parseURLParams:query];
    
    NSString *code = nil;

    if ([self.params valueForKey:@"dvntart://oauth2?code"])
         code = [self.params valueForKey:@"dvntart://oauth2?code"];
    
    
    if (code)
    {
        
        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"authorization_code",@"grant_type",
                                code,@"code",
                                kClientIDString, @"client_id",
                                kClientSecretString, @"client_secret", nil];
        
        [self getPath:@"https://www.deviantart.com/oauth2/draft10/token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            
            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
            
            NSLog(@"Response: %@", json);

            NSString *accessToken = [json objectForKey:@"access_token"];
           // NSString *refresh_token = [json objectForKey:@"refresh_token"];
            //NSString *expires = [json objectForKey:@"expires_in"];


            if (accessToken)
            {
                self.credential = [AFOAuthCredential credentialWithOAuthToken:accessToken tokenType:nil];
                // [self.credential setRefreshToken:refresh_token expiration:[NSDate dateWithTimeIntervalSinceNow:[expires integerValue]]];
                
                [AFOAuthCredential storeCredential:self.credential withIdentifier:self.serviceProviderIdentifier];
                
                [self setAuthorizationHeaderWithCredential:self.credential];
                
                NSLog(@"ACCESS TOKEN: %@", self.credential.accessToken);
                
                //Store the accessToken on userDefaults
                [[NSUserDefaults standardUserDefaults] setObject:self.credential.accessToken forKey:@"accessToken"];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [_loginDelegate performLoginFromHandle];
            }

            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            
        }];
        
    }
    
        return YES;
    
}

- (NSDictionary*)parseURLParams:(NSString *)query {
	NSArray *pairs = [query componentsSeparatedByString:@"&"];
	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
	for (NSString *pair in pairs) {
		NSArray *kv = [pair componentsSeparatedByString:@"="];
		NSString *val = [[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
		[params setObject:val forKey:[kv objectAtIndex:0]];
	}
    return params;
}

@end
