//
//  RMViewController.m
//  MasterShareSDK
//
//  Created by Ramiro Guerrero on 29/04/13.
//  Copyright (c) 2013 Ramiro Guerrero. All rights reserved.
//

#import "RMViewController.h"
#import "RMMasterSDK.h"
@interface RMViewController ()

@end

@implementation RMViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //FACEBOOK SDK testing:
    //[[RMMasterSDK FacebookSDK] getPublicPageWithQuery:@"platform" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicPlaceWithQuery:@"coffee" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicPlaceWithQuery:@"coffee" WithLatitude:@"37.7" WithLongitude:@"-122.427" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicPostsWithQuery:@"watermelon" WithParams:nil AndWithDelegate:nil];
    //[[RMMasterSDK FacebookSDK] getPublicGroupsWithQuery:@"programming" WithParams:nil AndWithDelegate:nil];

    //GOOGLE+ SDK testing:
    //[[RMMasterSDK GooglePlusSDK] getPublicPeopleProfileWithUserId:@"104560124403688998123" AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getPeopleSearchWithQuery:@"Mark" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getPeopleListByActivityWithActivityId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0" AndCollection:@"plusoners" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getPublicActivitiesListWithUserId:@"104560124403688998123" AndCollection:@"public" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getActivityWithActivityId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0" AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getActivitySearchWithQuery:@"Party" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getCommentsListWithActivityId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK GooglePlusSDK] getCommentWithCommentId:@"z13pcl2r0lidhpcid04cdpjqtv3lznixdd0.1316111505324000" AndWithDelegate:nil];
    
//    UIWebView *wv = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
    
    
    
//    NSString *scope = [NSString stringWithFormat:@"%@ %@", @"https://www.googleapis.com/auth/orkut", @"https://www.googleapis.com/auth/orkut.readonly"];
//    
//    [[RMMasterSDK OrkutSDK] setLoginDelegate:self];
//    [[RMMasterSDK OrkutSDK] authenticateWithScopes:scope];
//    
//    [self.view addSubview:[RMMasterSDK OrkutSDK].webView];
    
    
    //LIST OF PERMISSIONS: r_basicprofile, r_fullprofile, r_emailaddress, r_network, r_contactinfo, rw_nus, rw_groups, w_messages
    //TO ENTER SEVERAL PERMISSIONS AT ONCE: SEPARATE THE STRINGS WITH SPACES. For example: NSString *scopes = @"r_fullprofile r_emailaddress r_network";
    /*NSString *scopes = @"r_fullprofile rw_groups";
    
    [[RMMasterSDK LinkedInSDK] setLoginDelegate:self];
    [[RMMasterSDK LinkedInSDK] authenticateWithScopes:scopes];
    [self.view addSubview:[RMMasterSDK LinkedInSDK].webView];*/

    
    //FLICKR SDK TESTING:
    //[[RMMasterSDK FlickrSDK] getBlogsServicesWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getCamerasBrandsWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getCamerasBrandModelsWithBrandId:@"canon" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getCollectionsTreeWithCollectionId:nil OrUserId:@"37607482@N03" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getCommonsInstitutionsWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getContactsPublicListWithUserId:@"37607482@N03" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getFavoritesContextWithUserId:@"66422591@N08" AndPhotoId:@"8029111564" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getFavoritesPublicPhotosListWithUserId:@"66422591@N08" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGalleriesInfoWithGalleryId:@"6065-72157617483228192" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGalleriesListForPhotoWithPhotoId:@"314988630" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGalleriesListWithUserId:@"37607482@N03" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGalleriesPhotosWithGalleryId:@"6065-72157617483228192" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGroupsInfoWithGroupId:@"34427465497@N01" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGroupsSearchWithText:@"Beer" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGroupsDiscussRepliesListWithTopicId:@"72157625038324579" AndParameters:nil AndWithDelegate:nil];
    //PIDE AUTENTICACION APARENTEMENTE, COMPROBAR LUEGO:
        //[[RMMasterSDK FlickrSDK] getGroupsDiscussRepliesInfoWithTopicId:@"72157625038324579" AndReplyId:@"72157625040116805" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGroupsDiscussTopicsInfoWithTopicId:@"72157625038324579" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGroupsDiscussTopicsListWithGroupId:@"46744914@N00" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGroupsPoolsContextWithGroupId:@"1448553@N24" AndPhotoId:@"8703091265" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getGroupsPoolsPhotosWithGroupId:@"1448553@N24" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getInterestingnessListWithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getMachinetagsNamespacesWithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getMachinetagsPairsWithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getMachinetagsPredicatesWithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getMachinetagsRecentValuesWithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getMachinetagsValuesWithNamespace:@"barefoot" AndPredicate:@"baby" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPandaListWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPandaPhotosWithPandaName:@"ling ling" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPeopleFindByEmail:@"dexterm051@gmail.com" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPeopleFindByUsername:@"dexm1" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPeopleInfoWithUserId:@"37607482@N03" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPeoplePhotosOfWithUserId:@"37607482@N03" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPeoplePublicGroupsWithUserId:@"37607482@N03" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPeoplePublicPhotosWithUserId:@"37607482@N03" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosAllContextWithPhotoId:@"8703091265" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosContactsPublicPhotosWithUserId:@"37607482@N03" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosContextWithPhotoId:@"8703091265" AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosExifWithPhotoId:@"8703091265" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosFavoritesWithPhotoId:@"8703091265" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosInfoWithPhotoId:@"8703091265" AndParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosRecentWithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK FlickrSDK] getPhotosSizesWithPhotoId:@"8703091265" AndWithDelegate:nil];
    /*NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"-26.834564", @"lat", @"-65.219221", @"lon", @"20", @"radius", @"1999-05-01 12:00:00", @"min_upload_date", nil];
    [[RMMasterSDK FlickrSDK] getPhotosSearchWithParameters:params AndWithDelegate:nil];*/
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)performLoginFromHandle {
        
   // [[RMMasterSDK OrkutSDK] deleteActivityWithActivityId:@"GAwiGAoUCAEQo97uzgIYg_KrjAUgv_m08wQQHg" AndWithDelegate:nil];
    
   // [[RMMasterSDK OrkutSDK] getActivitiesListWithCollection:@"stream" WithUserId:@"me" WithParameters:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK OrkutSDK] getActivityVisibilityWithActivityId:@"GAwiHQoZCAEQo97uzgIY3fOrjAUg3ZTXvfn_____ARAe" AndWithDelegate:nil];
    
  // [[RMMasterSDK OrkutSDK] putActivityVisibilityWithActivityId:@"GAwiHQoZCAEQo97uzgIY3fOrjAUg3ZTXvfn_____ARAe" WithParameters:[NSDictionary dictionaryWithObjectsAndKeys:@"hidden", @"visibility", nil] AndWithDelegate:nil];
    
   // [[RMMasterSDK OrkutSDK] patchActivityVisibilityWithActivityId:@"GAwiHQoZCAEQo97uzgIY3fOrjAUg3ZTXvfn_____ARAe" WithParameters:[NSDictionary dictionaryWithObjectsAndKeys:@"hidden", @"visibility", nil] AndWithDelegate:nil];

    //[[RMMasterSDK OrkutSDK] getBadgesListWithUserId:@"me" AndWithDelegate:nil];
    
    //[[RMMasterSDK OrkutSDK] getCountersListWithUserId:@"me" AndWithDelegate:nil];
    
   // [[RMMasterSDK OrkutSDK] postCommentWithActivityId:@"GAwiHQoZCAEQo97uzgIY3fOrjAUg3ZTXvfn_____ARAe" WithParameters:[NSDictionary dictionaryWithObjectsAndKeys:@"this is a comment", @"content", nil] AndWithDelegate:nil];
    
    // NSData *dataToSEnd = UIImageJPEGRepresentation([UIImage imageNamed:@"asd.png"], 0.1);
    
    // [[RMMasterSDK DeviantArtSDK] postSubmitOnStaWithFile:dataToSEnd Parameters:[NSDictionary dictionaryWithObjectsAndKeys:@"Test", @"Title", nil] AndWithDelegate:nil];
    
    //[[RMMasterSDK DeviantArtSDK] postMoveFileOnStaWithStashId:@"4342586905948352" Parameters:nil AndWithDelegate:nil];
    
    // [[RMMasterSDK DeviantArtSDK] postRenameFolderOnStaWithFolder:@"New" WithFolderId:@"5615157401027624" AndWithDelegate:nil];
    
    // [[RMMasterSDK DeviantArtSDK] getAvailibleSpaceOnStaWithDelegate:nil];
    
    //  [[RMMasterSDK DeviantArtSDK] getListFoldersAndSubmissionsOnStaWithParameters:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK DeviantArtSDK] postFetchFolderAndSubmissionDataOnStaWithStashId:@"5982545012521093" WithFolderId:@"6024923543342390" WithParameters:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK DeviantArtSDK] postFetchSubmissionMediaOnStaWithStashId:@"5982545012521093" AndWithDelegate:nil];
    
    // [[RMMasterSDK DeviantArtSDK] postDeleteOnStaWithStashId:@"5982545012521093" AndWithDelegate:nil];
    
        
}


-(void)performLinkedInLoginFromHandle {
    
    //[[RMMasterSDK LinkedInSDK] getCurrentUserProfileWithFieldSelectors:@":(first-name,last-name)" AndWithDelegate:nil];
    //NO ANDA, CONSEGUIR MEMBERID:
    //[[RMMasterSDK LinkedInSDK] getUserProfileWithMemberId:@"" WithFieldSelectors:nil AndWithDelegate:nil];
    //NO ANDA, DICE QUE FALLA EL PROFILE URL:
    //[[RMMasterSDK LinkedInSDK] getUserProfileWithProfileURL:@"" WithFieldSelectors:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK LinkedInSDK] getCurrentUserConnectionsWithParameters:nil WithFieldSelectors:nil AndWithDelegate:nil];
    
    /*NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"Sergio", @"first-name", nil];
    [[RMMasterSDK LinkedInSDK] getPeopleSearchWithParameters:params WithFieldSelectors:nil AndWithDelegate:nil];*/
    
    //[[RMMasterSDK LinkedInSDK] getGroupProfileDetailsWithGroupId:@"3954140" WithFieldSelectors:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getCurrentUserGroupMembershipsWithFieldSelectors:nil WithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getCurrentUserShowGroupSettingsWithGroupId:@"3954140" WithFieldSelectors:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] putJoinGroupWithGroupId:@"3699196" AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] deleteLeaveGroupWithGroupId:@"3699196" AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getGroupPostsWithGroupId:@"3954140" WithParameters:nil WithFieldSelectors:nil AndWithDelegate:nil];
    /*NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"creator", @"role", nil];
    [[RMMasterSDK LinkedInSDK] getCurrentUserGroupPostsWithGroupId:@"3954140" WithParameters:params WithFieldSelectors:nil AndWithDelegate:nil];*/
    //[[RMMasterSDK LinkedInSDK] getPostDetailsWithPostId:@"g-164026-S-222162265" WithFieldSelectors:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getPostCommentsWithPostId:@"g-3954140-S-235650527" WithFieldSelectors:nil WithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getCommentWithCommentId:@"g-3954140-S-235650527-133997714" WithFieldSelectors:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getCurrentUserSuggestedGroupsWithFieldSelectors:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] deleteCurrentUserGroupSuggestionWithGroupId:@"4007217" AndWithDelegate:nil];
    
    //[[RMMasterSDK LinkedInSDK] getJobDetailsWithJobId:@"1511685" WithFieldSelectors:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getCurrentUserJobBookmarksWithFieldSelectors:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] postBookmarkJobWithJobId:@"" AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] deleteJobBookmarkWithJobId:@"" AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getCurrentUserJobSuggestionsWithFieldSelectors:nil AndWithDelegate:nil];
    /*NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:@"Programmer", @"keywords", nil];
    [[RMMasterSDK LinkedInSDK] getSearchJobWithParameters:params WithFieldSelectors:nil AndWithDelegate:nil];*/
    

    //[[RMMasterSDK LinkedInSDK] postShareWithBody:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getMemberUpdatesWithParameters:nil AndWithDelegate:nil];
    //[[RMMasterSDK LinkedInSDK] getMemberStatisticsWithDelegate:nil];
    
}

@end
