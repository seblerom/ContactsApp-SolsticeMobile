//
//  ContactListCell.h
//  ContactsApp
//
//  Created by alvaro sebastian leon romero on 1/9/16.
//  Copyright © 2016 Solstice Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactListCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *contactSmallImage;
@property (weak, nonatomic) IBOutlet UILabel *contactName;
@property (weak, nonatomic) IBOutlet UILabel *contactPhone;
@property (weak, nonatomic) IBOutlet UIView *contactSmallImageView;

@end
