//
//  NFAsker.m
//  NorthFace
//
//  Created by Carlos Rios on 9/23/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFAsker.h"

@implementation NFAsker
@synthesize questions =_questions;
@synthesize answers = _answers;

-(id) init {
  self = [super init];
  self.currentIndex = 0;
  self.questions = [[NSMutableArray alloc] init];
  self.answers = [[NSMutableDictionary alloc] init];
  return self;
}
-(void) addQuestion:(NFQuestion *) question{
  
  [self.questions addObject:question];
  
}
-(NSInteger) count{
  
  return [self.questions count];
}
-(BOOL) questionAnswered{
  
  return ([self.answers count ] == 0);
}
- (void) addAnswerForCurrentQuestion:(NSString*)answer{
  switch (self.currentIndex) {
    case 0:
      [self.answers setValue:answer forKey:@"activity"];
      break;
    case 1:
      [self.answers setValue:answer forKey:@"benefits"];
      break;
    case 2:
      [self.answers setValue:answer forKey:@"category"];
      break;
    default:
      break;
  }
   
}
- (NFQuestion*) questionAtIndex:(NSInteger)index{
  return [self.questions objectAtIndex:index];
}
-(void) incrementQuestion{
  self.currentIndex +=1;
  if (self.currentIndex == 4) {
    self.currentIndex = 0;
  }
  
}
@end
