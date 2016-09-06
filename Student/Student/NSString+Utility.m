//
//  NSString+Utility.m
//  SqliteDemo
//
//  Created by agilemac-74 on 05/07/16.
//  Copyright © 2016 Agile. All rights reserved.
//

#import "NSString+Utility.h"

@implementation NSString (Utility)


+(NSString *)getPathForFileName:(NSString *)strFileName withFileType:(NSString *)strFileType
{
    return [[NSBundle mainBundle] pathForResource:strFileName ofType:strFileType];
    
}
@end
