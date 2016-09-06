//
//  AddSemesterViewController.h
//  Student
//
//  Created by agile on 02/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddSemesterViewController : UIViewController<UITextFieldDelegate>
{
   
}

@property (nonatomic,strong)IBOutlet UITextField *numOfSubjectTextField;
@property (nonatomic,strong)IBOutlet UITextField *SemesterDetailTextField;
- (IBAction)enterSemesterBtn:(id)sender;


@end
