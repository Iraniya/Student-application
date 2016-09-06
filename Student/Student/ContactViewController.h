//
//  ContactViewController.h
//  Student
//
//  Created by agile on 05/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ContactViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableViewObject;
    NSMutableDictionary *userContact;
    NSMutableArray *usersContactArray;
    NSMutableArray *allUserDetailsArray ;
    NSArray *sortedKeys;
}

@end
