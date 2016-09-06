//
//  NSFileManager+Utility.m
//  Student
//
//  Created by agilepc-140 on 06/07/16.
//  Copyright (c) 2016 iraniya. All rights reserved.
//

#import "NSFileManager+Utility.h"

@implementation NSFileManager (Utility)

+(void)createFolderInDocumentDirectory:(NSString*)folderName
{
    NSArray *aryPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSFileManager *fileManager =[NSFileManager defaultManager];
    
    NSString *strPath = [aryPath firstObject];
    
    strPath = [strPath stringByAppendingString:[NSString stringWithFormat:@"/Student/%@",folderName]];
    
    [fileManager createDirectoryAtPath:strPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSLog(@"app path:%@",strPath);
}

@end
