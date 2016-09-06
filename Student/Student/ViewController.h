//
//  ViewController.h
//  Student
//
//  Created by agilepc-14 on 6/25/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITextFieldDelegate,UIScrollViewAccessibilityDelegate>
{
    IBOutlet UIScrollView *scrollViewObject;  
    NSMutableArray *UserSignUpData;
    BOOL isSignIn;
}
- (IBAction)signUpBtnClick:(id)sender;
- (IBAction)signInBtnClick:(id)sender;

@property (strong, nonatomic) IBOutlet UITextField *EmailIdTextField;
@property (strong, nonatomic) IBOutlet UITextField *PasswordTextField;

@end
