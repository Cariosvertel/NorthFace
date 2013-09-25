//
//  NFSearcher.h
//  NorthFace
//
//  Created by Carlos Rios on 9/24/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NFSearcher : NSObject

@property (nonatomic, strong) NSArray* lastQuery;
@property (nonatomic, strong) NSArray* result;
-(id) initWithData :(NSArray*) array;
-(void) search:(NSDictionary*) tags;
@end
