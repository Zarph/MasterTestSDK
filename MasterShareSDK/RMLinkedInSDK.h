//
//  RMLinkedInSDK.h
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


#import "AFOAuth2Client.h"

@protocol LinkedInDelegate <NSObject>
@optional
-(void)performLinkedInLoginFromHandle;
@end


@interface RMLinkedInSDK : AFOAuth2Client<UIWebViewDelegate>

@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;
@property (nonatomic, strong) NSObject <LinkedInDelegate> *loginDelegate;
@property (nonatomic, strong) UIWebView *webView;

+ (RMLinkedInSDK *)sharedClient;
-(void)authenticateWithScopes:(NSString *)scopes;

//PEOPLE
//Profile API, more info: http://developer.linkedin.com/documents/profile-api
-(void)getCurrentUserProfileWithDelegate:(NSObject <LinkedInDelegate> *)delegate;
-(void)getUserProfileWithMemberId:(NSString *)memberID AndWithDelegate:(NSObject <LinkedInDelegate> *)delegate;
-(void)getUserProfileWithProfileURL:(NSString *)profileURL AndWithDelegate:(NSObject <LinkedInDelegate> *)delegate;

//Connections API, more info: http://developer.linkedin.com/documents/connections-api
-(void)getCurrentUserConnectionsWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <LinkedInDelegate> *)delegate;

//People Search API, more info: http://developer.linkedin.com/documents/people-search-api
-(void)getPeopleSearchWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <LinkedInDelegate> *)delegate;

@end
