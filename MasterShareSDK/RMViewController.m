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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)performLoginFromHandle {
    
    NSLog(@"ACESS");
    
   // [[RMMasterSDK OrkutSDK] deleteActivityWithActivityId:@"GAwiGAoUCAEQo97uzgIYg_KrjAUgv_m08wQQHg" AndWithDelegate:nil];
    
   // [[RMMasterSDK OrkutSDK] getActivitiesListWithCollection:@"stream" WithUserId:@"me" WithParameters:nil AndWithDelegate:nil];
    
    //[[RMMasterSDK OrkutSDK] getActivityVisibilityWithActivityId:@"GAwiHQoZCAEQo97uzgIY3fOrjAUg3ZTXvfn_____ARAe" AndWithDelegate:nil];
    
   //[[RMMasterSDK OrkutSDK] putActivityVisibilityWithActivityId:@"GAwiHQoZCAEQo97uzgIY3fOrjAUg3ZTXvfn_____ARAe" AndWithDelegate:nil];
    
    //[[RMMasterSDK OrkutSDK] patchActivityVisibilityWithActivityId:@"GAwiHQoZCAEQo97uzgIY3fOrjAUg3ZTXvfn_____ARAe" AndWithDelegate:nil];

    //[[RMMasterSDK OrkutSDK] getBadgesListWithUserId:@"me" AndWithDelegate:nil];
    
    //[[RMMasterSDK OrkutSDK] getCountersListWithUserId:@"me" AndWithDelegate:nil];
    
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
}

@end
