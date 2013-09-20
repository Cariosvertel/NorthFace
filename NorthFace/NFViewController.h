//
//  NFViewController.h
//  NorthFace
//
//  Created by Carlos Rios on 9/19/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NFDatabaseController.h"

@interface NFViewController : UIViewController <UICollectionViewDataSource>
@property (strong, nonatomic) NFDatabaseController* products;
@end
