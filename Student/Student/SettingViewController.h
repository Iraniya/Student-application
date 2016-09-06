//
//  SettingViewController.h
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SettingViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableViewObject;
    NSArray *settingArrayList;
}
-(IBAction)btnClick:(id)sender;
@end
