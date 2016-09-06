//
//  ProfileViewController.h
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate,UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
{
    IBOutlet UITableView *tableViewObject ;  //table view Object
    IBOutlet UIView *pickerViewObject;   //picker ViewObject
    IBOutlet UIPickerView *pickerObject;  //another view for picker view
    IBOutlet UIButton *editbutton;
    BOOL isEdit; //to edit the details
    int userId;   //to store user id
    NSMutableArray *arrayList;  //display textfield
    NSArray *educationArray;
    
}

- (IBAction)pickerViewDoneBtnClick:(id)sender;
- (IBAction)editBtnClick:(id)sender;

@property (weak, nonatomic) IBOutlet UIImageView *profileImageView;
@property (nonatomic,strong)NSMutableArray *userDetailArray;  //store user array
@property(nonatomic,strong)NSMutableArray *currentUserDetailArray;

@property(nonatomic,strong)NSMutableDictionary *userDetailDictionary;
@property(nonatomic,strong) NSMutableDictionary *currentUserDetailsDict; //store from sign up page previous data
@property(nonatomic,strong)NSArray *keyArray;
@end
