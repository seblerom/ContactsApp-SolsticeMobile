//
//  Phone.m
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import "Phone.h"

@interface Phone()

@property (nonatomic,strong)NSString * workPhone;
@property (nonatomic,strong)NSString * homePhone;
@property (nonatomic,strong)NSString * mobilePhone;

@end


@implementation Phone

-(id)initWithWorPhone:(NSString*)work homephone:(NSString*)home mobilePhone:(NSString*)mobile{
    
    self = [super init];
    if( self )
    {
        // This property can only be accessed within the class
        self.workPhone = work;
        self.homePhone = home;
        self.mobilePhone = mobile;
    }
    return self;
}

-(NSString*)getWorkPhone{
    return  self.workPhone;
}
-(NSString*)getHomePhone{
    return self.homePhone;
}
-(NSString*)getMobilePhone{
    return self.mobilePhone;
}
@end
