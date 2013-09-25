//
//  NFAsker.h
//  NorthFace
//
//  Created by Carlos Rios on 9/23/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NFQuestion.h"

@interface NFAsker : NSObject

@property (nonatomic,strong) NSMutableArray *questions;
@property (nonatomic,strong) NSMutableDictionary *answers;
@property (nonatomic,assign) NSInteger currentIndex;


-(void) addQuestion:(NFQuestion *) question;
-(NSInteger) count;
-(BOOL) questionAnswered;
- (void) addAnswerForCurrentQuestion:(NSString*)answer;
-(NFQuestion*) questionAtIndex:(NSInteger)index;
-(void) incrementQuestion;
@end
