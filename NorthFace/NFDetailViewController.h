//
//  NFDetailViewController.h
//  NorthFace
//
//  Created by Carlos Rios on 9/25/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NFDetailViewController : UIViewController<UICollectionViewDataSource, UICollectionViewDelegate>
@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet UILabel *name;
@property (strong, nonatomic) IBOutlet UITextView *specs;
@property (strong, nonatomic) IBOutlet UITextView *details;
@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;
@property (strong, nonatomic) NSArray *products;
@property (nonatomic, strong) NSDictionary *product;
@property (nonatomic, strong) NSMutableArray *recommendations;
@end
