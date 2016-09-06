//
//  MeViewController.h
//  Student
//
//  Created by agile on 21/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "ViewController.h"

@interface MeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    IBOutlet UITableView *tableViewObject;
    
    NSMutableArray *infoDetailsArray;
}
@end
