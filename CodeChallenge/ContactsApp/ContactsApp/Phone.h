//
//  Phone.h
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Phone : NSObject
-(id)initWithWorPhone:(NSString*)work homephone:(NSString*)home mobilePhone:(NSString*)mobile;

-(NSString*)getWorkPhone;
-(NSString*)getHomePhone;
-(NSString*)getMobilePhone;
@end
