//
//  SignUp.h
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignUp : UIViewController<UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate>
{
    IBOutlet UITableView *tableViewObject ;     //table view Object
    
    IBOutlet UIView *pickerViewObject;          //picker ViewObject
    IBOutlet UIPickerView *pickerObject;   //another view for picker view
    
    NSMutableArray *arrayList;
    NSArray *educationArray; //to display education details in picker view
    
    //new Changes
    
    NSMutableArray *aryScreenData;
}

- (IBAction)pickerViewDoneBtnClick:(id)sender;
- (IBAction)submitBtnClick:(id)sender;

@property (nonatomic,strong) NSMutableArray *userDetailArray;  //store user array
@property (nonatomic,strong)NSMutableDictionary *userDetailDictionary;  //dictionary for user

@end
