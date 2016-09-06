//
//  HomeViewController.h
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController<UITabBarControllerDelegate,UITableViewDataSource,UITableViewDelegate>
{
    //UITabBarController *tabBarControllerObject;
    IBOutlet UITableView *tableViewObject;
    
    NSMutableArray *studentEducationDetails;
    NSMutableDictionary *studentSemDetails;
}
@end
