//
//  Contacto.h
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Phone.h"
@interface Contacto : NSObject

- (id)initWithName:(NSString*)name employeeId:(int)employeeId company:(NSString*)company detailsUrl:(NSString*)detailsUrl smallImage:(NSString*)smallImage birthDate:(NSString*)birthdate phone:(Phone*)phone;

-(NSString*)getName;
-(Phone*)getPhone;
-(NSString*)getSmallImageURL;
-(NSString*)getCompany;
-(NSString*)getUrlDetail;
-(NSString*)getBirthDay;
-(int)getEmployeeID;
@end
