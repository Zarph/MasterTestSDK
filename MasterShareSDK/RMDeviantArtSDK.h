//
//  RMDeviantArtSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 03/05/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "AFOAuth2Client.h"

@protocol DeviantArtDelegate <NSObject>
@optional
-(void)performLoginFromHandle;

@end

@interface RMDeviantArtSDK : AFOAuth2Client

@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;
@property (nonatomic, strong) NSObject <DeviantArtDelegate> *loginDelegate;

+ (RMDeviantArtSDK *)sharedClient;
-(void)authenticate;
- (BOOL)handleOpenURL:(NSURL *)url;

-(void)refreshAccessToken;

@end
