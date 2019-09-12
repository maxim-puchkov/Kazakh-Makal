//
//  MoreTableViewController.m
//  Kazakhstan Proverbs
//
//  Created by admin on 2016-06-02.
//  Copyright © 2016 Maxim Puchkov. All rights reserved.
//

#import "MoreTableViewController.h"
#import "STKColorAccessoryView.h"

@interface MoreTableViewController ()

@end

@implementation MoreTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.apps = @[
                  @[@"Казахская Клавиатура+", @"$0.99", @"kk", @"kazahskaa-klaviatura+/id1084095398"],
                  @[@"Казахстан+", @"FREE", @"kz", @"kazahstan+/id1091212805"],
                  @[@"Что если..", @"FREE", @"wi", @"cto-esli/id1084890813"],
                  @[@"Курс GameMaker", @"FREE", @"gp", @"game-programming-course/id1088648581"],
                  @[@"Курс Java", @"FREE", @"jp", @"java-programming-course/id1103514179"],
                  @[@"VR Природа", @"$0.99", @"vrn", @"vr-nature/id1109935893"]
                  ];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"leftMenu.png"]];
    self.tableView.backgroundView = imageView;
    
    [self.tableView setSeparatorColor:[UIColor clearColor]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated {
    self.navigationController.navigationBar.topItem.title = @"Дополнительно";
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.apps count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 60;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 15;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *v = [UIView new];
    [tableView setBackgroundColor:[UIColor clearColor]];
    return v;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"moreCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    cell.textLabel.text = self.apps[indexPath.section][0];
    cell.detailTextLabel.text = self.apps[indexPath.section][1];
    cell.detailTextLabel.textColor = [UIColor blackColor];
    UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"icon_%@120.png", self.apps[indexPath.section][2]]];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFit;
    cell.imageView.image = image;
    cell.backgroundColor = [UIColor clearColor];
    cell.accessoryView = [STKColorAccessoryView accessoryViewWithColor:[UIColor blackColor]];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"https://itunes.apple.com/us/app/%@?ls=1&mt=8", self.apps[indexPath.section][3]]];
    [[UIApplication sharedApplication] openURL:url];
}

@end
