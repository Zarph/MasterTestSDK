//
//  RMAppDelegate.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 18/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMAppDelegate.h"

#import "RMMasterSDK.h"

#import "RMViewController.h"

#import "AFNetworkActivityIndicatorManager.h"


@implementation RMAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:8 * 1024 * 1024 diskCapacity:20 * 1024 * 1024 diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    [[AFNetworkActivityIndicatorManager sharedManager] setEnabled:YES];

    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    RMViewController *viewController = [[RMViewController alloc] init];
    
    self.window.rootViewController = viewController;
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    //TWITTER SDK, test the methods by commenting/uncommenting the following lines:
    
    //TIMELINES TESTS:
    //[[RMMasterSDK TwitterSDK] getTimelinesResourceWithResourcePath:@"mentions_timeline" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getTimelinesResourceWithResourcePath:@"user_timeline" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getTimelinesResourceWithResourcePath:@"home_timeline" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getTimelinesResourceWithResourcePath:@"retweets_of_me" AndParameters:nil AndWithDelegate:nil];
    
    //TWEETS TESTS:
    //[[RMMasterSDK TwitterSDK] getTweetsResourceWithResourcePath:@"retweets" AndID:@"21947795900469248" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getTweetsResourceWithResourcePath:@"show" AndID:@"210462857140252672" AndParameters:nil AndWithDelegate:nil];
    /* NSDictionary *params = @{ @"id" : @"240192632003911681" };
    [[RMMasterSDK TwitterSDK] getTweetsResourceWithResourcePath:@"oembed" AndID:nil AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"status" : @"Blablabla" };
    [[RMMasterSDK TwitterSDK] postTweetsResourceWithResourcePath:@"update" AndID:nil AndParameters:params AndWithDelegate:nil]; */
    //[[RMMasterSDK TwitterSDK] postTweetsResourceWithResourcePath:@"destroy" AndID:@"327837698964480000" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] postTweetsResourceWithResourcePath:@"retweet" AndID:@"241259202004267009" AndParameters:nil AndWithDelegate:nil];
    /* UIImage *image = [UIImage imageNamed:@"watermelon.jpg"];
    NSDictionary *params = @{ @"status" : @"Blablabla" };
    [[RMMasterSDK TwitterSDK] postTweetsUpdateWithMedia:image AndParameters:params AndWithDelegate:nil]; */
    
    //SEARCH TESTS:
    //[[RMMasterSDK TwitterSDK] getSearchTweetsWithQuery:@"ironman" AndParameters:nil AndWithDelegate:nil];
    
    //FAVORITES TESTS:
    //[[RMMasterSDK TwitterSDK] getFavoritesListWithParameters:nil AndWithDelegate:nil];
    /* NSDictionary *params = @{ @"id" : @"243138128959913986" };
    [[RMMasterSDK TwitterSDK] postFavoritesWithResourcePath:@"create" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"id" : @"243138128959913986" };
    [[RMMasterSDK TwitterSDK] postFavoritesWithResourcePath:@"destroy" AndParameters:params AndWithDelegate:nil]; */
    
    //LISTS TESTS:
    //[[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"list" AndParameters:nil AndWithDelegate:nil];
    /* NSDictionary *params = @{ @"slug": @"team",
                              @"owner_screen_name": @"twitter"};
    [[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"statuses" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"slug": @"team",
                              @"owner_screen_name": @"twitter"};
    [[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"subscribers" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"slug": @"team",
                              @"owner_screen_name": @"twitter",
                              @"screen_name": @"episod"};
    [[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"subscribers/show" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"slug": @"team",
                              @"owner_screen_name": @"twitter",
                              @"screen_name": @"froginthevalley"};
    [[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"members/show" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"slug": @"team",
                              @"owner_screen_name": @"twitterapi"};
    [[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"members" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"slug": @"team",
                              @"owner_screen_name": @"twitter"};
    [[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"show" AndParameters:params AndWithDelegate:nil]; */
    //[[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"subscriptions" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getListsWithResourcePath:@"ownerships" AndParameters:nil AndWithDelegate:nil];
    /* NSDictionary *params = @{ @"name": @"Goonies",
                              @"mode": @"public",
                              @"description": @"Test list"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"create" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214",
                              @"description": @"Updated description"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"update" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214",
                              @"screen_name": @"ram_g92"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"members/create" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214",
                              @"screen_name": @"rsarver,episod,jasoncosta,theseancook,kurrik,froginthevalley"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"members/create_all" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214",
                              @"screen_name": @"ram_g92"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"members/destroy" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214",
                              @"screen_name": @"rsarver,episod,jasoncosta,theseancook,kurrik,froginthevalley"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"members/destroy_all" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"subscribers/create" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"subscribers/destroy" AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"list_id": @"88883214"};
    [[RMMasterSDK TwitterSDK] postListsWithResourcePath:@"destroy" AndParameters:params AndWithDelegate:nil]; */
    
    //SAVED SEARCHES TESTS:
    //[[RMMasterSDK TwitterSDK] getSavedSearchesWithResourcePath:@"list" AndID:nil AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getSavedSearchesWithResourcePath:@"show" AndID:@"278764648" AndParameters:nil AndWithDelegate:nil];
    /* NSDictionary *params = @{ @"query": @"sandwiches"};
    [[RMMasterSDK TwitterSDK] postSavedSearchesWithResourcePath:@"create" AndID:nil AndParameters:params AndWithDelegate:nil]; */
    //[[RMMasterSDK TwitterSDK] postSavedSearchesWithResourcePath:@"destroy" AndID:@"278764648" AndParameters:nil AndWithDelegate:nil];
    
    //PLACES & GEO TESTS:
    //[[RMMasterSDK TwitterSDK] getPlacesAndGeoWithResourcePath:@"id" AndID:@"df51dec6f4ee2b2c" AndParameters:nil AndWithDelegate:nil];
    /* NSDictionary *params = @{ @"lat": @"37.76893497",
                              @"long": @"-122.42284884"};
    [[RMMasterSDK TwitterSDK] getPlacesAndGeoWithResourcePath:@"reverse_geocode" AndID:nil AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"query": @"Toronto"};
    [[RMMasterSDK TwitterSDK] getPlacesAndGeoWithResourcePath:@"search" AndID:nil AndParameters:params AndWithDelegate:nil]; */
    /* NSDictionary *params = @{ @"lat": @"37",
                              @"long": @"-122",
                              @"name": @"Twitter HQ"};
    [[RMMasterSDK TwitterSDK] getPlacesAndGeoWithResourcePath:@"similar_places" AndID:nil AndParameters:params AndWithDelegate:nil]; */
    /*
    //For this next method you should use the "similar_places" method and then pass to this method the token it returns.
    //Example parameters, you should fill in with the appropiate ones:
    NSDictionary *params = @{ @"lat": @"37.76893497",
                              @"long": @"-122.42284884",
                              @"token": @"36179c9bf78835898ebf521c1defd4be",
                              @"contained_within": @"247f43d441defc03",
                              @"name": @"Twitter HQ"};
    [[RMMasterSDK TwitterSDK] postPlacesAndGeoPlaceWithParameters:params AndWithDelegate:nil]; */
    
    //TRENDS TESTS:
    /* NSDictionary *params = @{ @"id": @"1"};
    [[RMMasterSDK TwitterSDK] getTrendsWithResourcePath:@"place" AndParameters:params AndWithDelegate:nil]; */
    //[[RMMasterSDK TwitterSDK] getTrendsWithResourcePath:@"available" AndParameters:nil AndWithDelegate:nil];
    /* NSDictionary *params = @{ @"lat": @"37.781157",
                              @"long": @"-122.400612831116"};
    [[RMMasterSDK TwitterSDK] getTrendsWithResourcePath:@"closest" AndParameters:params AndWithDelegate:nil]; */
    
    //SPAM REPORTING TESTS:
    /*
    //Example parameters, you should fill in with the appropiate ones:
    NSDictionary *params = @{ @"screen_name": @"noradio"};
    [[RMMasterSDK TwitterSDK] postSpamReportingReportSpamWithParameters:params AndWithDelegate:nil]; */
    
    
    //HELP TESTS:
    //[[RMMasterSDK TwitterSDK] getHelpWithResourcePath:@"configuration" AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getHelpWithResourcePath:@"languages" AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getHelpWithResourcePath:@"privacy" AndWithDelegate:nil];
    //[[RMMasterSDK TwitterSDK] getHelpWithResourcePath:@"tos" AndWithDelegate:nil];
    /* NSString *resourceList = @"statuses,help,users,search";
    [[RMMasterSDK TwitterSDK] getHelpApplicationRateLimitStatusWithResources:resourceList AndWithDelegate:nil]; */
    
    
    /* NSDictionary *param = [NSDictionary dictionaryWithObjectsAndKeys:@"",@"",
     nil];*/
    
    //[[RMMasterSDK TwitterSDK] getFriendsAndFollowersFriendshipsWithResourcePath:@"" AndParams:nil AndWithDelegate:nil];
    
    // [[RMMasterSDK TwitterSDK] getFriendsAndFollowersFollowersWithResourcePath:@"" AndParams:nil AndWithDelegate:nil];
    
    // [[RMMasterSDK TwitterSDK] getFriendsAndFollowersFriendsWithResourcePath:@"" AndParams:nil AndWithDelegate:nil];
    
    
    //[[RMMasterSDK TwitterSDK] getUsersAccountWithResourcePath:@"" AndParams:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK TwitterSDK] getUsersBlocksWithResourcePath:@"" AndParams:nil AndWithDelegate:nil];
    
    // [[RMMasterSDK TwitterSDK] getUsersSuggestionsMembersWithSlug:@"" AndParams:nil AndWithDelegate:nil];
    
    // [[RMMasterSDK TwitterSDK] getUsersSuggestionsWithParams:nil AndWithDelegate:nil];
    
    // [[RMMasterSDK TwitterSDK] getUsersSuggestionsWithSlug:@"" AndParams:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK TwitterSDK] getUsersUsersWithResourcePath:@"" AndParams:param AndWithDelegate:nil];
    
    //[[RMMasterSDK TwitterSDK] postFriendsAndFollowersFriendshipsWithResourcePath:@"" AndParams:param AndWithDelegate:nil];
    
    //[[RMMasterSDK TwitterSDK] postUsersAccountWithResourcePath:@"" AndImage:[UIImage imageNamed:@""] AndParams:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK TwitterSDK] postUsersAccountWithResourcePath:@"" AndParams:param AndWithDelegate:nil];
    
    //[[RMMasterSDK TwitterSDK] postUsersBlocksWithResourcePath:@"" AndParams:param AndWithDelegate:nil];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [[RMMasterSDK DeviantArtSDK] handleOpenURL:url];
}

-(BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [[RMMasterSDK DeviantArtSDK] handleOpenURL:url];
}

@end
