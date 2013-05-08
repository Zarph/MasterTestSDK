//
//  RMLinkdedInSDK.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero & Marco Graciano on 5/2/13.
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

#import "RMLinkdedInSDK.h"

static NSString * const kOAuth2BaseURLString = @"https://api.linkedin.com/uas/oauth2/";
static NSString * const kServerAPIURL = @"https://api.linkedin.com/uas/";
static NSString * const kClientIDString = @"i1v2u6bu41lm";//FILL IN WITH YOUR OWN API KEY
static NSString * const kClientSecretString = @"RhiuoIbwBqA7qflg";//FILL IN WITH YOUR OWN API SECRET

@implementation RMLinkdedInSDK

+ (RMLinkdedInSDK *)sharedClient {
    static RMLinkdedInSDK *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *url = [NSURL URLWithString:kOAuth2BaseURLString];
        _sharedClient = [RMLinkdedInSDK clientWithBaseURL:url clientID:kClientIDString secret:kClientSecretString];
        
        _sharedClient.credential = [AFOAuthCredential retrieveCredentialWithIdentifier:_sharedClient.serviceProviderIdentifier];
        if (_sharedClient.credential != nil) {
            [_sharedClient setAuthorizationHeaderWithCredential:_sharedClient.credential];
        }
        
        
    });
    
    return _sharedClient;
}



-(void)authenticateWithScopes:(NSString *)scopes{
    
    [self authenticateUsingOAuthWithPath:@"authorization" scope:scopes redirectURI:@"http://roninrecruiting.com/" success:^(AFOAuthCredential *credential) {
        
        NSLog(@"SUCCESS");
        
    } failure:^(NSError *error) {
        
        NSLog(@"FAILURE");

    }];
}

- (void)authenticateUsingOAuthWithPath:(NSString *)path
                                 scope:(NSString *)scope
                           redirectURI:(NSString *)uri
                               success:(void (^)(AFOAuthCredential *credential))success
                               failure:(void (^)(NSError *error))failure
{
    NSMutableDictionary *mutableParameters = [NSMutableDictionary dictionary];
    [mutableParameters setValue:scope forKey:@"scope"];
    [mutableParameters setValue:uri forKey:@"redirect_uri"];
    [mutableParameters setValue:@"code" forKey:@"response_type"];
    [mutableParameters setValue:@"EWDWQXZZAGTH348qdghjku" forKey:@"state"];
    [mutableParameters setValue:@"code" forKey:@"response_type"];
    
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
    parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    [self clearAuthorizationHeader];
    
    NSURLRequest *request = [self requestWithMethod:@"GET" path:path parameters:parameters];
    
    NSLog(@"MutableWeb :%@", request.URL);
    
    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    self.webView.delegate = self;
    [self.webView loadRequest:request];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    NSString *html = [self.webView stringByEvaluatingJavaScriptFromString:
                      @"document.body.innerHTML"];
    
    NSLog(@"HTML: %@", html);
    NSString *currentURL = self.webView.request.mainDocumentURL.absoluteString;
    NSLog(@"URL: %@", currentURL);
    
//    NSString *code = [self.webView stringByEvaluatingJavaScriptFromString:
//                      @"document.getElementById('code').value"];
//    
//    NSLog(@"CODE: %@", code);
//    
//    if (code.length > 0)
//    {
//        [self.webView removeFromSuperview];
//        [self makeTokenRequestWithCode:code];
//    }
}


@end
