//
//  NFSearcher.m
//  NorthFace
//
//  Created by Carlos Rios on 9/24/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFSearcher.h"

@implementation NFSearcher
@synthesize data = _data;
@synthesize result = _result;

-(id) initWithData :(NSArray*) array {
  self = [super init];
  self.result = [[NSArray alloc] initWithArray:array];
  self.data = self.result;
  return  self;
}
-(void) search:(NSDictionary*) tags{
 
  
  
  switch([tags count])
  {
    case 1:
    {NSLog(@"%@", [tags valueForKey:@"activity"]);
      NSPredicate *predicate = [NSPredicate predicateWithFormat:@"activity = %@",[tags valueForKey:@"activity"]];
      self.result = [self.result filteredArrayUsingPredicate:predicate];
      break;
    }
    case 2:
    {
      NSPredicate *predicate = [NSPredicate predicateWithFormat:@"benefits = %@",[tags valueForKey:@"benefits"]];
      self.result = [self.result filteredArrayUsingPredicate:predicate];
      break;
    }
    case 3:
    {
      NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category = %@",[tags valueForKey:@"category"]];
      self.result = [self.result filteredArrayUsingPredicate:predicate];
      break;
    }
  }
 }

@end
