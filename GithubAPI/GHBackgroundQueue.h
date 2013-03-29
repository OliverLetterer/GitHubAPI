//
//  GHBackgroundQueue.h
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright 2013 Sparrow-Labs. All rights reserved.
//

#import "CTRESTfulCoreData.h"
#import "AFNetworking.h"



/**
 @abstract  <#abstract comment#>
 */
@interface GHBackgroundQueue : AFHTTPClient <CTRESTfulCoreDataBackgroundQueue>

@end



/**
 @abstract  Singleton category
 */
@interface GHBackgroundQueue (Singleton)

+ (GHBackgroundQueue *)sharedInstance;

@end
