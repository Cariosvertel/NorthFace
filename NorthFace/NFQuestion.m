//
//  NFQuestion.m
//  NorthFace
//
//  Created by Carlos Rios on 9/23/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFQuestion.h"

@implementation NFQuestion
@synthesize question = _question;
@synthesize tag = _tag;
@synthesize answers = _answers;

- (id) initWithQuestion: (NSString*) question{
  self = [super init];
  self.question = question;
  self.answers = [[NSMutableArray alloc]init];
  
  return self;
  
}
- (void)addPossibleAnswer:(NSString*) answer{
  
  // verify if answer exist
  BOOL exist = false;
  for (int i = 0; i<[self.answers count]; i++) {
    BOOL value = [[self.answers objectAtIndex:i] isEqualToString:answer];
    if (value) {
      exist = true;
    }
    
  }
  // add answer
  if (!exist) {
    [self.answers addObject:answer];
  }
  
}

@end
