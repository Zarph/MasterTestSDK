//
//  RMTwitterSDK.h
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 24/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import <Social/Social.h>
#import <Accounts/Accounts.h>

@protocol TwitterDelegate <NSObject>


@end

@interface RMTwitterSDK : NSObject

+ (RMTwitterSDK *)sharedClient;

//TIMELINES
//You can pass as Resource Path: mentions_timeline, user_timeline, home_timeline, retweets_of_me.
-(void)getTimelinesResourceWithResourcePath:(NSString *)resourcePath AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//TWEETS
//You can pass as Resource Path: retweets, show, oembed . If you pass as resource path "oembed", then you should pass nil as ID and pass the ID in the parameters dictionary.
-(void)getTweetsResourceWithResourcePath:(NSString *)resourcePath AndID:(NSString *)ID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;
//You can pass as Resource Path: destroy, update, retweet. For "update" ID should be nil.
-(void)postTweetsResourceWithResourcePath:(NSString *)resourcePath AndID:(NSString *)ID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;
//This method is for doing a status update with an image.
-(void)postTweetsUpdateWithMedia:(UIImage *)image AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//SEARCH
-(void)getSearchTweetsWithQuery:(NSString *)query AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//FAVORITES
-(void)getFavoritesListWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;
//You can pass as Resource Path: destroy, create.
-(void)postFavoritesWithResourcePath:(NSString *)resourcePath AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate; 
//LISTS
//You can pass as Resource Path: list, statuses, subscribers, subscribers/show, members, members/show, subscriptions, ownerships.
-(void)getListsWithResourcePath:(NSString *)resourcePath AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;
//You can pass as Resource Path: create, update, destroy, members/create, members/create_all, members/destroy, members/destroy_all, subscribers/create, subscribers/destroy.
-(void)postListsWithResourcePath:(NSString *)resourcePath AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//SAVED SEARCHES
//You can pass as Resource Path: list, show. For "list" ID should be nil.
-(void)getSavedSearchesWithResourcePath:(NSString *)resourcePath AndID:(NSString *)ID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;
//You can pass as Resource Path: create, destroy. For "create" ID should be nil.
-(void)postSavedSearchesWithResourcePath:(NSString *)resourcePath AndID:(NSString *)ID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//PLACES & GEO
//You can pass as Resource Path: id, reverse_geocode, search, similar_places. For "reverse_geocode", "search" and "similar_places" ID should be nil.
-(void)getPlacesAndGeoWithResourcePath:(NSString *)resourcePath AndID:(NSString *)ID AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;
-(void)postPlacesAndGeoPlaceWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//TRENDS
//You can pass as Resource Path: place, available, closest.
-(void)getTrendsWithResourcePath:(NSString *)resourcePath AndParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//SPAM REPORTING
-(void)postSpamReportingReportSpamWithParameters:(NSDictionary *)params AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

//HELP
//You can pass as Resource Path: configuration, languages, privacy, tos. 
-(void)getHelpWithResourcePath:(NSString *)resourcePath AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;
//This next method has only one parameter: resourceList, which can be a comma separated list of resource families to get current the rate limits for. For example: statuses,friends,trends,help
-(void)getHelpApplicationRateLimitStatusWithResources:(NSString *)resourceList AndWithDelegate:(NSObject <TwitterDelegate> *)delegate;

@end
