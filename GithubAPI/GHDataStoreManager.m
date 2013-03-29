//
//  GHDataStoreManager.m
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright 2013 Sparrow-Labs. All rights reserved.
//

#import "GHDataStoreManager.h"



@interface GHDataStoreManager () {
    
}

@end



@implementation GHDataStoreManager

#pragma mark - CTDataStoreManager

- (NSManagedObjectContext *)newManagedObjectContextWithConcurrencyType:(NSManagedObjectContextConcurrencyType)concurrencyType automaticallyMergesChangesWithOtherContexts:(BOOL)automaticallyMergesChangesWithOtherContexts
{
    NSManagedObjectContext *context = [super newManagedObjectContextWithConcurrencyType:concurrencyType automaticallyMergesChangesWithOtherContexts:automaticallyMergesChangesWithOtherContexts];
    context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy;
    
    return context;
}

- (NSString *)humanReadableInterfaceName
{
    return NSLocalizedString(@"Database", @"");
}

- (NSString *)managedObjectModelName
{
    return @"GithubAPI";
}

@end
