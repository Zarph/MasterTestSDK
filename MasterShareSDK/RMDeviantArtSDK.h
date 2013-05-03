//
//  RMDeviantArtSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 03/05/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "AFOAuth2Client.h"

@protocol DeviantArtDelegate <NSObject>

@end

@interface RMDeviantArtSDK : AFOAuth2Client

@property (nonatomic, retain) NSDictionary *params;
@property (nonatomic, retain) AFOAuthCredential *credential;

+ (RMDeviantArtSDK *)sharedClient;
-(void)authenticate;
- (BOOL)handleOpenURL:(NSURL *)url;

@end
