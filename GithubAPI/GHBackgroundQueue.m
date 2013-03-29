//
//  GHBackgroundQueue.m
//  GithubAPI
//
//  Created by Oliver Letterer on 06.03.13.
//  Copyright 2013 Sparrow-Labs. All rights reserved.
//

#import "GHBackgroundQueue.h"



@interface GHBackgroundQueue () {
    
}

@end





@implementation GHBackgroundQueue

#pragma mark - CTRESTfulCoreDataBackgroundQueue

+ (id<CTRESTfulCoreDataBackgroundQueue>)sharedQueue
{
    return [self sharedInstance];
}

- (void)getRequestToURL:(NSURL *)URL
      completionHandler:(void(^)(id JSONObject, NSError *error))completionHandler
{
    NSMutableURLRequest *request = [self requestWithMethod:@"GET" path:URL.absoluteString parameters:nil];
    
    AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        if (completionHandler) {
            completionHandler(JSON, nil);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (completionHandler) {
            completionHandler(JSON, error);
        }
    }];
    
    [self enqueueHTTPRequestOperation:requestOperation];
}

- (void)deleteRequestToURL:(NSURL *)URL
         completionHandler:(void(^)(NSError *error))completionHandler
{
    NSMutableURLRequest *request = [self requestWithMethod:@"DELETE" path:URL.absoluteString parameters:nil];
    
    NSDictionary *JSONObject = @{};
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:JSONObject options:0 error:NULL];
    
    [request setHTTPBody:JSONData];
    [request setValue:[NSString stringWithFormat:@"%d", JSONData.length] forHTTPHeaderField:@"Content-Length"];
    
    AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        if (completionHandler) {
            completionHandler(nil);
        }
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        if (completionHandler) {
            completionHandler(error);
        }
    }];
    
    [self enqueueHTTPRequestOperation:requestOperation];
}

- (void)postJSONObject:(id)JSONObject
                 toURL:(NSURL *)URL
     completionHandler:(void(^)(id JSONObject, NSError *error))completionHandler
{
    [self postJSONObject:JSONObject toURL:URL withSetupHandler:NULL completionHandler:completionHandler];
}

- (void)postJSONObject:(id)JSONObject
                 toURL:(NSURL *)URL
      withSetupHandler:(void(^)(NSMutableURLRequest *request))setupHandler
     completionHandler:(void(^)(id JSONObject, NSError *error))completionHandler
{
    JSONObject = JSONObject ?: @{};
    
    NSMutableURLRequest *request = [self requestWithMethod:@"POST" path:URL.absoluteString parameters:nil];
    
    NSError *error = nil;
    NSData *JSONData = [NSData data];
    
    if (JSONObject) {
        JSONData = [NSJSONSerialization dataWithJSONObject:JSONObject options:0 error:&error];
    }
    
    if (error) {
        if (completionHandler) {
            completionHandler(nil, error);
        }
    } else {
        [request setHTTPBody:JSONData];
        [request setValue:[NSString stringWithFormat:@"%d", JSONData.length] forHTTPHeaderField:@"Content-Length"];
        
        if (setupHandler) {
            setupHandler(request);
        }
        
        AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            if (completionHandler) {
                completionHandler(JSON, nil);
            }
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            if (completionHandler) {
                completionHandler(nil, error);
            }
        }];
        
        [self enqueueHTTPRequestOperation:requestOperation];
    }
}

- (void)putJSONObject:(id)JSONObject
                toURL:(NSURL *)URL
    completionHandler:(void(^)(id JSONObject, NSError *error))completionHandler
{
    JSONObject = JSONObject ?: @{};
    
    NSMutableURLRequest *request = [self requestWithMethod:@"PUT" path:URL.absoluteString parameters:nil];
    
    NSError *error = nil;
    NSData *JSONData = [NSJSONSerialization dataWithJSONObject:JSONObject options:0 error:&error];
    
    if (error) {
        if (completionHandler) {
            completionHandler(nil, error);
        }
    } else {
        [request setHTTPBody:JSONData];
        
        AFJSONRequestOperation *requestOperation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
            if (completionHandler) {
                completionHandler(JSON, nil);
            }
        } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
            if (completionHandler) {
                completionHandler(JSON, error);
            }
        }];
        
        [self enqueueHTTPRequestOperation:requestOperation];
    }
}

@end



#pragma mark - Singleton implementation

@implementation GHBackgroundQueue (Singleton)

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
