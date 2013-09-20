//
//  NFCollectionViewCell.h
//  NorthFace
//
//  Created by Carlos Rios on 9/20/13.
//  Copyright (c) 2013 Carlos Rios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NFCollectionViewCell : UICollectionViewCell
@property (strong, nonatomic) IBOutlet UILabel *productName;
@property (strong, nonatomic) IBOutlet UIImageView *productImage;

@end
