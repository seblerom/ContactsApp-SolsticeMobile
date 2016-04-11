//
//  Contacto.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "Contacto.h"

@interface Contacto()

@property (strong,nonatomic) NSString * name;
@property (nonatomic) int employeeId;
@property (strong,nonatomic) NSString * company;
@property (strong,nonatomic) NSString * detailsURL;
@property (strong,nonatomic) NSString * smallImageURL;
@property (strong,nonatomic) NSString * birthdate;
@property (strong,nonatomic) Phone * phone;

@end

@implementation Contacto


- (id)initWithName:(NSString*)name employeeId:(int)employeeId company:(NSString*)company detailsUrl:(NSString*)detailsUrl smallImage:(NSString*)smallImage birthDate:(NSString*)birthdate phone:(Phone*)phone{
    
    self = [super init];
    if( self )
    {
        self.name = name;
        self.employeeId = employeeId;
        self.company = company;
        self.detailsURL = detailsUrl;
        self.smallImageURL = smallImage;
        self.birthdate = birthdate;
        self.phone = phone;
    }
    return self;
}

-(NSString*)getName{
    return self.name;
}

-(Phone*)getPhone{
    return self.phone;
}

-(NSString*)getSmallImageURL{
    return  self.smallImageURL;
}
-(NSString*)getCompany{
    return self.company;
}
-(NSString*)getUrlDetail{
    return self.detailsURL;
}
-(NSString*)getBirthDay{
    return self.birthdate;
}
-(int)getEmployeeID{
    return self.employeeId;
}
@end
