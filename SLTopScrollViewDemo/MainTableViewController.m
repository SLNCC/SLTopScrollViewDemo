//
//  MainTableViewController.m
//  SLTopScrollViewDemo
//
//  Created by 乔冬 on 16/10/12.
//  Copyright © 2016年 XinHuaTV. All rights reserved.
//

#import "MainTableViewController.h"
#import "SLScrollParentViewController.h"
#import "StaticViewController.h"
#import "ScrollViewController.h"
#import "MainViewController.h"
@interface MainTableViewController ()

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"reuseIdentifier1"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"reuseIdentifier1"];
    }
    
    NSArray *array = @[@"staticTile",@"srollTile",@"navinationBarTitle"];
    cell.textLabel.text = array[indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    int index = (int)indexPath.row;
    switch (index) {
        case 0:
        {
            StaticViewController *staticVC = [[StaticViewController alloc] init];
            [self.navigationController pushViewController:staticVC animated:YES];
        }
            break;
        case 1:
        {
            ScrollViewController *scrollVC = [[ScrollViewController alloc] init];
            [self.navigationController pushViewController:scrollVC animated:YES];
            
        }
            break;
            
        case 2:
        {
            MainViewController *mainVC = [[MainViewController alloc] init];
            [self.navigationController pushViewController:mainVC animated:YES];
        }
        
            break;
        default:
            break;
    }
    
}



@end
