//
//  ProverbsTableViewController.h
//  Kazakhstan Proverbs
//
//  Created by admin on 2016-05-20.
//  Copyright © 2016 Maxim Puchkov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProverbsTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *content;
@property (strong, nonatomic) NSArray *alphabet;
@property (strong, nonatomic) NSUserDefaults *defaults;

@end
