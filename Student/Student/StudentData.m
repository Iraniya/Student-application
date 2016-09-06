//
//  StudentData.m
//  Student
//
//  Created by agile on 08/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "StudentData.h"

@implementation StudentData


-(id)initWithData:(NSMutableDictionary *)dictStudent;
{
    
    self=[super init];
    
    if (self) {
        
        self.status     = (BOOL)[dictStudent valueForKey:@"status"];
        self.studentId  = (int)[[dictStudent valueForKey:@"id"]intValue];
        self.userName   = [dictStudent valueForKey:@"userName"];
        self.firstName  = [dictStudent valueForKey:@"firstName"];
        self.lastName   = [dictStudent valueForKey:@"lastName"];
        self.emailId    = [dictStudent valueForKey:@"emailId"];
        self.password   = [dictStudent valueForKey:@"password"];
        self.phone      = [dictStudent valueForKey:@"phone"];
        self.education  = [dictStudent valueForKey:@"education"];
        self.address1   = [dictStudent valueForKey:@"address1"];
        self.address2   = [dictStudent valueForKey:@"address2"];
        self.educationDetails =[dictStudent valueForKey:self.education];
    }
        return  self;
}

//init
/*
- (id)init
{
    
    inizilizationDictionary = [NSMutableDictionary new];
    [inizilizationDictionary setObject:NO forKey:@"status"];
    [inizilizationDictionary setObject:@"" forKey:@"id"];
    [inizilizationDictionary setObject:@"" forKey:@"userName"];
    [inizilizationDictionary setObject:@"" forKey:@"firstName"];
    [inizilizationDictionary setObject:@"" forKey:@"lastName"];
    [inizilizationDictionary setObject:@"" forKey:@"emailId"];
    [inizilizationDictionary setObject:@"" forKey:@"password"];
    [inizilizationDictionary setObject:@"" forKey:@"phone"];
    [inizilizationDictionary setObject:@"" forKey:@"education"];
    [inizilizationDictionary setObject:@"" forKey:@"address1"];
    [inizilizationDictionary setObject:@"" forKey:@"address2"];
    
    
    
    return [self initWithData:inizilizationDictionary];
}

*/

//getting semester details
-(NSArray*)educationDetailsArrayForSemester:(int)semester AndDictinoryOfSemesterDetails:(NSDictionary*)SemesterDetails
{
    NSMutableArray *educationArray = [[NSMutableArray alloc]init];
    
    [educationArray insertObject:SemesterDetails atIndex:semester];
    
    return educationArray;
}
@end
