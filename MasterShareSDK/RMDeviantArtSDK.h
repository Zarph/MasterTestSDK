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

-(void)getUserInfoWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)getUserdAmnAuthTokenWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)postSubmitOnStaWithFile:(NSData *)uploadFile Parameters:(NSDictionary *)params AndWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)postDeleteOnStaWithStashId:(NSString *)stashid AndWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)postMoveFileOnStaWithStashId:(NSString *)stashid Parameters:(NSDictionary *)params AndWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)postRenameFolderOnStaWithFolder:(NSString *)newFolder WithFolderId:(NSString *)folderId AndWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)getAvailibleSpaceOnStaWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)getListFoldersAndSubmissionsOnStaWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;
-(void)postFetchFolderAndSubmissionDataOnStaWithStashId:(NSString *)stashid WithFolderId:(NSString *)folderId WithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <DeviantArtDelegate> *)delegate; // Double-check this method
-(void)postFetchSubmissionMediaOnStaWithStashId:(NSString *)stashid AndWithDelegate:(NSObject <DeviantArtDelegate> *)delegate;


@end
