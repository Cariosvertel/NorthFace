//
//  NFDatabaseController.m
//  NorthFace
//
//  Created by Carlos Rios on 9/20/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import "NFDatabaseController.h"

@implementation NFDatabaseController

@synthesize name = _name;
@synthesize sku = _sku;
@synthesize type = _type;
@synthesize specs = specs;
@synthesize activity = _activity;
@synthesize category = _category;
@synthesize benefits = _benefits;
@synthesize price = _price;
@synthesize stock = _stock;
@synthesize details = _details;
@synthesize feature1 = _feature1;
@synthesize feature2 = _feature2;
@synthesize feature3 = _feature3;
@synthesize feature4 = _feature4;
@synthesize feature5 = _feature5;
@synthesize url = _url;

-(id) init{
  
  self = [super init];
  
  // load plist
  if (self) {
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    NSString *plistPath;
    NSString *rootPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                                              NSUserDomainMask, YES) objectAtIndex:0];
    plistPath = [rootPath stringByAppendingPathComponent:@"Products.plist"];
    if (![[NSFileManager defaultManager] fileExistsAtPath:plistPath]) {
      plistPath = [[NSBundle mainBundle] pathForResource:@"Products" ofType:@"plist"];
    }
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSDictionary *temp = (NSDictionary *)[NSPropertyListSerialization
                                          propertyListFromData:plistXML
                                          mutabilityOption:NSPropertyListMutableContainersAndLeaves
                                          format:&format
                                          errorDescription:&errorDesc];
    if (!temp) {
      NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    
    self.name = [NSArray arrayWithArray:[temp objectForKey:@"name"]];
    self.sku = [NSArray arrayWithArray:[temp objectForKey:@"sku"]];
    self.type = [NSArray arrayWithArray:[temp objectForKey:@"type"]];
    self.specs = [NSArray arrayWithArray:[temp objectForKey:@"specs"]];
    self.activity = [NSArray arrayWithArray:[temp objectForKey:@"activity"]];
    self.category = [NSArray arrayWithArray:[temp objectForKey:@"category"]];
    self.benefits = [NSArray arrayWithArray:[temp objectForKey:@"benefits"]];
    self.price = [NSArray arrayWithArray:[temp objectForKey:@"price"]];
    self.stock = [NSArray arrayWithArray:[temp objectForKey:@"stock"]];
    self.details = [NSArray arrayWithArray:[temp objectForKey:@"details"]];
    self.feature1 = [NSArray arrayWithArray:[temp objectForKey:@"feature1"]];
    self.feature2 = [NSArray arrayWithArray:[temp objectForKey:@"feature2"]];
    self.feature3 = [NSArray arrayWithArray:[temp objectForKey:@"feature3"]];
    self.feature4 = [NSArray arrayWithArray:[temp objectForKey:@"feature4"]];
    self.feature5 = [NSArray arrayWithArray:[temp objectForKey:@"feature5"]];
    self.url = [NSArray arrayWithArray:[temp objectForKey:@"url"]];
    
  }
  
  return self;
}
@end
