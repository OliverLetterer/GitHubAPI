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

#pragma mark - SLCoreDataStack

- (NSString *)managedObjectModelName
{
    return @"GithubAPI";
}

@end
