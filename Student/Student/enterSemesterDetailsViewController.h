//
//  enterSemesterDetailsViewController.h
//  Student
//
//  Created by agile on 02/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface enterSemesterDetailsViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UIScrollView *scrollViewObject;
    IBOutlet UITextField *SubjectTextField;
    IBOutlet UITextField *MarksTextField;
    
    NSMutableArray *subjectsArray;
    NSMutableDictionary *marksDict;
}
- (IBAction)submitBtnClick:(UIButton *)sender;

@property NSInteger semesterNumber;
@property NSInteger numnerOfSubjects;
@end
