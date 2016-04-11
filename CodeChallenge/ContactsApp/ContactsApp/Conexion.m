//
//  Conexion.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "Conexion.h"

@implementation Conexion


+ (void)jsonRequestWithBaseURL:(NSString *)baseURL parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *json, BOOL success))completion{
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    configuration.requestCachePolicy = NSURLRequestReloadIgnoringCacheData;
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc] initWithSessionConfiguration:configuration];
    [manager POST:baseURL parameters:parameters success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",[responseObject description]);
        NSDictionary *jsonDictionary = (NSDictionary *)responseObject;
        if (completion)
            completion(jsonDictionary, YES);
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        
        NSLog(@"%@",[error localizedDescription]);
    }];    
}
+ (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               if ( !error )
                               {
                                   UIImage *image = [[UIImage alloc] initWithData:data];
                                   completionBlock(YES,image);
                               } else{
                                   completionBlock(NO,nil);
                               }
                           }];
}
@end
