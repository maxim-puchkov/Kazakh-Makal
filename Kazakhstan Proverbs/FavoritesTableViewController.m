//
//  FavoritesTableViewController.m
//  Kazakhstan Proverbs
//
//  Created by admin on 2016-06-01.
//  Copyright © 2016 Maxim Puchkov. All rights reserved.
//

#import "FavoritesTableViewController.h"
#import "STKColorAccessoryView.h"

@interface FavoritesTableViewController ()

@end

@implementation FavoritesTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.defaults = [NSUserDefaults standardUserDefaults];
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    self.tableView.contentInset = UIEdgeInsetsMake(0.0f, 0.0f, CGRectGetHeight(self.tabBarController.tabBar.frame), 0.0f);

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.png"]];
    self.tableView.backgroundView = imageView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    self.content = [self.defaults objectForKey:@"favorites"];
    NSLog(@"content of favorite: %@", self.content);
    [self.tableView reloadData];
    
    [UIView animateWithDuration:(0.20)
                     animations:^ {
                         self.tabBarController.tabBar.alpha = 1.0;
                     }];
    
    self.navigationController.navigationBar.topItem.title = @"Любимые";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self determineNumberOfSections:self.content] count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionTitles = [self determineNumberOfSections:self.content];
    return [[self rowsInSectionWithInitialLetter:sectionTitles[section]] count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *sectionTitles = [self determineNumberOfSections:self.content];
    return sectionTitles[section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"favoriteCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    NSArray *sectionTitles = [self determineNumberOfSections:self.content];
    NSArray *rows = [self rowsInSectionWithInitialLetter:sectionTitles[indexPath.section]];
    
    NSArray *titles = [rows[indexPath.row] componentsSeparatedByString:@" > "];
    NSString *cellTitle = titles[0];
    NSString *detailTitle;
    if ([titles count] > 1) {
        detailTitle = titles[1];
    }
    cell.textLabel.text = cellTitle;
    cell.detailTextLabel.text = detailTitle;
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryView = [STKColorAccessoryView accessoryViewWithColor:[UIColor blackColor]];

    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSArray *contentOfCell = @[cell.textLabel.text, cell.detailTextLabel.text];
    [self.defaults setObject:contentOfCell forKey:@"SelectedCell"];
    [self.defaults synchronize];
    //self.tabBarController.tabBar.hidden = YES;
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [UIView animateWithDuration:(0.05)
                     animations:^ {
                         self.tabBarController.tabBar.alpha = 0.0;
                     }];
}

- (NSArray *)determineNumberOfSections:(NSArray *)array {
    NSMutableArray *sections = [[NSMutableArray alloc] init];
    for (int i = 0; i < [array count]; i++) {
        NSString *letter;
        letter = [[array[i] substringToIndex:1] capitalizedString];
        if ([sections count] == 0) {
            [sections addObject:letter];
        } else {
            for (int k = 0; k < [sections count]; k++) {
                if ([sections[k] isEqualToString:letter]) {
                    break;
                }
                if (k == ([sections count] - 1)) {
                    [sections addObject:letter];
                }
            }
        }
    }
    //NSLog(@"Sections: %@", sections);
    NSArray *sectionsArray = [sections sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    //NSLog(@"%@", sectionsArray);
    return sectionsArray;
}

- (NSArray *)rowsInSectionWithInitialLetter:(NSString *)letter {
    NSMutableArray *sort = [[NSMutableArray alloc] init];
    for (int i = 0; i < [self.content count]; i++) {
        if ([[[self.content[i] substringToIndex:1] capitalizedString] isEqualToString:letter]) {
            [sort addObject:self.content[i]];
        }
    }
    NSArray *rows = [sort sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return rows;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
