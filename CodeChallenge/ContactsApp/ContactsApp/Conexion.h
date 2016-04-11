//
//  Conexion.h
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>

@interface Conexion : NSObject


+ (void)jsonRequestWithBaseURL:(NSString *)baseURL parameters:(NSDictionary *)parameters completion:(void (^)(NSDictionary *json, BOOL success))completion;
+ (void)downloadImageWithURL:(NSURL *)url completionBlock:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
@end
