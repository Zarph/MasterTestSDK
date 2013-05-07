//
//  RMOrkutSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero & Marco Graciano on 06/05/13
//    Copyright (c) 2013 Weston McBride
//
//    Permission is hereby granted, free of charge, to any
//    person obtaining a copy of this software and associated
//    documentation files (the "Software"), to deal in the
//    Software without restriction, including without limitation
//    the rights to use, copy, modify, merge, publish,
//    distribute, sublicense, and/or sell copies of the
//    Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice
//    shall be included in all copies or substantial portions of
//    the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY
//    KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE
//    WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
//    PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS
//    OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR
//    OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR
//    OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
//    SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import "RMOrkutSDK.h"
#import "AFJSONRequestOperation.h"

static NSString * const kOAuth2BaseURLString = @"https://accounts.google.com/o/";
static NSString * const kServerAPIURL = @"https://accounts.google.com/o/";
static NSString * const kClientIDString = @"753397185616-u3frsi5tm75muupdhb7srd1ha382f8dg.apps.googleusercontent.com";
static NSString * const kClientSecretString = @"dj2YMJBtCRD9w29N8yc3qVib";

@implementation RMOrkutSDK

+ (RMOrkutSDK *)sharedClient {
    static RMOrkutSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:kOAuth2BaseURLString];
        _sharedClient = [RMOrkutSDK clientWithBaseURL:url clientID:kClientIDString secret:kClientSecretString];
        
        
        _sharedClient.credential = [AFOAuthCredential retrieveCredentialWithIdentifier:_sharedClient.serviceProviderIdentifier];
        if (_sharedClient.credential != nil) {
            [_sharedClient setAuthorizationHeaderWithCredential:_sharedClient.credential];
        }
        
        
    });
    
    return _sharedClient;
}

-(void)authenticate {
    
    [self authenticateUsingOAuthWithPath:@"oauth2/auth" scope:@"https://www.googleapis.com/auth/plus.login" redirectURI:@"urn:ietf:wg:oauth:2.0:oob" success:^(AFOAuthCredential *credential) {
        
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
    [mutableParameters setValue:scope forKey:@"scope"];
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
    
    NSURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:parameters];
    
    NSLog(@"MutableWeb :%@", request.URL);
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 300, 460)];
    self.webView.delegate = self;
    [self.webView loadRequest:request];

    
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *html = [self.webView stringByEvaluatingJavaScriptFromString:
                      @"document.body.innerHTML"];
    
    NSLog(@"HTML: %@", html);
    
    NSString *code = [self.webView stringByEvaluatingJavaScriptFromString:
                      @"document.getElementById('code').value"];
    
    NSLog(@"CODE: %@", code);
        
    if (code.length > 0)
    {
        [self.webView removeFromSuperview];
        [self makeTokenRequestWithCode:code];
    }
}

-(void)makeTokenRequestWithCode:(NSString *)code{
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:code, @"code",
                            kClientIDString, @"client_id",
                            kClientSecretString, @"client_secret",
                            @"urn:ietf:wg:oauth:2.0:oob", @"redirect_uri",
                            @"authorization_code", @"grant_type",nil];
    [self postPath:@"https://accounts.google.com/o/oauth2/token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
        
                   NSLog(@"Response: %@", json);
        
                    NSString *accessToken = [json objectForKey:@"access_token"];
                    NSString *refresh_token = [json objectForKey:@"refresh_token"];
                    NSString *expires = [json objectForKey:@"expires_in"];
        
        
                    if (accessToken)
                    {
                        self.credential = [AFOAuthCredential credentialWithOAuthToken:accessToken tokenType:nil];
                        [self.credential setRefreshToken:refresh_token expiration:[NSDate dateWithTimeIntervalSinceNow:[expires integerValue]]];

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
//- (BOOL)handleOpenURL:(NSURL *)url{
//    
//    
//    NSString *query = [NSString stringWithFormat:@"%@",url];
//    if (!query) {
//        query = [url query];
//    }
//    
//    self.params = [self parseURLParams:query];
//    
//    NSString *code = nil;
//    
//    if ([self.params valueForKey:@""])
//        code = [self.params valueForKey:@""];
//    
//    
//    NSLog(@"query: %@", query);
//    
//    if (code)
//    {
//        
//        NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"authorization_code",@"grant_type",
//                                code,@"code",
//                                kClientIDString, @"client_id",
//                                kClientSecretString, @"client_secret", nil];
//        
//        [self getPath:@"https://www.deviantart.com/oauth2/draft10/token" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
//            
//            
//            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:nil];
//            
//            NSLog(@"Response: %@", json);
//            
//            NSString *accessToken = [json objectForKey:@"access_token"];
//            NSString *refresh_token = [json objectForKey:@"refresh_token"];
//            NSString *expires = [json objectForKey:@"expires_in"];
//            
//            
//            if (accessToken)
//            {
//                self.credential = [AFOAuthCredential credentialWithOAuthToken:accessToken tokenType:nil];
//                [self.credential setRefreshToken:refresh_token expiration:[NSDate dateWithTimeIntervalSinceNow:[expires integerValue]]];
//                
//                [AFOAuthCredential storeCredential:self.credential withIdentifier:self.serviceProviderIdentifier];
//                
//                [self setAuthorizationHeaderWithCredential:self.credential];
//                
//                NSLog(@"ACCESS TOKEN: %@", self.credential.accessToken);
//                
//                //Store the accessToken on userDefaults
//                [[NSUserDefaults standardUserDefaults] setObject:self.credential.accessToken forKey:@"accessToken"];
//                [[NSUserDefaults standardUserDefaults] synchronize];
//                
//                [_loginDelegate performLoginFromHandle];
//            }
//            
//            
//        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
//            
//            
//        }];
//        
//    }
//    
//    return YES;
//    
//}
//
//- (NSDictionary*)parseURLParams:(NSString *)query {
//	NSArray *pairs = [query componentsSeparatedByString:@"&"];
//	NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
//	for (NSString *pair in pairs) {
//		NSArray *kv = [pair componentsSeparatedByString:@"="];
//		NSString *val = [[kv objectAtIndex:1] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
//        
//		[params setObject:val forKey:[kv objectAtIndex:0]];
//	}
//    return params;
//}

@end
