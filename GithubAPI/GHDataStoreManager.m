//
//  GHDataStoreManager.m
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright 2013 Sparrow-Labs. All rights reserved.
//

#import "GHDataStoreManager.h"
#import "SLRESTfulCoreData.h"
#import "GHBackgroundQueue.h"
#import "GHDataStoreManager.h"



@interface GHDataStoreManager () {
    
}

@end



@implementation GHDataStoreManager

+ (void)initialize
{
    if (self != [GHDataStoreManager class]) {
        return;
    }
    
    [NSManagedObject setDefaultBackgroundQueue:[GHBackgroundQueue sharedInstance]];
    
    [NSManagedObject registerDefaultBackgroundThreadManagedObjectContextWithAction:^NSManagedObjectContext *{
        return [GHDataStoreManager sharedInstance].backgroundThreadManagedObjectContext;
    }];
    
    [NSManagedObject registerDefaultMainThreadManagedObjectContextWithAction:^NSManagedObjectContext *{
        return [GHDataStoreManager sharedInstance].mainThreadManagedObjectContext;
    }];
    
    [SLObjectConverter setDefaultDateTimeFormat:@"yyyy-MM-dd'T'HH:mm:ss'Z'"];
    
    [SLAttributeMapping registerDefaultObjcNamingConvention:@"identifier" forJSONNamingConvention:@"id"];
    [SLAttributeMapping registerDefaultObjcNamingConvention:@"URL" forJSONNamingConvention:@"url"];
}

#pragma mark - SLCoreDataStack

- (NSString *)humanReadableInterfaceName
{
    return NSLocalizedString(@"Database", @"");
}

- (NSString *)managedObjectModelName
{
    return @"GithubAPI";
}

@end
