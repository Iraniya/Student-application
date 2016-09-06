//
//  StudentData.h
//  Student
//
//  Created by agile on 08/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentData : NSObject
{
    NSMutableDictionary *inizilizationDictionary;
}
@property BOOL status;
@property int studentId;
@property(nonatomic,strong) NSString *userName;
@property(nonatomic,strong) NSString *firstName;
@property(nonatomic,strong) NSString *lastName;
@property(nonatomic,strong) NSString *emailId;
@property(nonatomic,strong) NSString *password;
@property(nonatomic,strong) NSString *phone;
@property(nonatomic,strong) NSString *education;
@property(nonatomic,strong) NSString *address1;
@property(nonatomic,strong) NSString *address2;
@property(nonatomic,strong) NSMutableArray *educationDetails;

-(id)initWithData:(NSMutableDictionary *)dictStudent;

@end
