//
//  NFQuestion.h
//  NorthFace
//
//  Created by Carlos Rios on 9/23/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFQuestion : NSObject
@property (strong,nonatomic) NSString *question;
@property (strong,nonatomic) NSString *tag;
@property (strong,nonatomic) NSMutableArray *answers;

- (id) initWithQuestion: (NSString*) question;
- (void)addPossibleAnswer:(NSString*) answer;
@end
