//
//  GHAppDelegate.m
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright (c) 2013 Sparrow-Labs. All rights reserved.
//

#import "GHAppDelegate.h"
#import "GHUser.h"
#import "GHRepository.h"
#import "GHIssue.h"
#import "GHDataStoreManager.h"
#import "GHBackgroundQueue.h"

@implementation GHAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    [NSManagedObject setDefaultBackgroundQueue:[GHBackgroundQueue sharedInstance]];
    
    [GHUser userWithName:@"OliverLetterer" completionHandler:^(GHUser *user, NSError *error) {
        [user repositoriesWithCompletionHandler:^(NSArray *repositories, NSError *error) {
            
            for (GHRepository *repository in repositories) {
                NSLog(@"%d", repository.owner == user);
            }
            repositories = [repositories sortedArrayUsingComparator:^NSComparisonResult(GHRepository *repository1, GHRepository *repository2) {
                return [repository1.name compare:repository2.name];
            }];
            
            GHRepository *repository = repositories[2];
            [repository issuesWithCompletionHandler:^(NSArray *issues, NSError *error) {
                NSLog(@"%@", [issues valueForKeyPath:@"title"]);
            }];
        }];
    }];
    
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

@end
