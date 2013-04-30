//
//  GHBackgroundQueue.m
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright 2013 Sparrow-Labs. All rights reserved.
//

#import "GHBackgroundQueue.h"
#import "GHDataStoreManager.h"



@interface GHBackgroundQueue () {
    
}

@end





@implementation GHBackgroundQueue

@end



#pragma mark - Singleton implementation

@implementation GHBackgroundQueue (Singleton)

+ (void)initialize
{
    if (self != [GHBackgroundQueue class]) {
        return;
    }
    
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

+ (GHBackgroundQueue *)sharedInstance 
{
    static GHBackgroundQueue *_instance = nil;
    
	static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[super allocWithZone:NULL] initWithBaseURL:[NSURL URLWithString:@"https://api.github.com/"]];
    });
    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone 
{	
	return [self sharedInstance];	
}

- (id)copyWithZone:(NSZone *)zone 
{
    return self;	
}

@end
