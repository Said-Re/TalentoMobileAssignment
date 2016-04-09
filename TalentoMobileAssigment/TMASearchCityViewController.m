//
//  TMASearchCityViewController.m
//  TalentoMobileAssigment
//
//  Created by Said Rehouni on 6/4/16.
//  Copyright © 2016 Said Rehouni. All rights reserved.
//

#import "TMASearchCityViewController.h"

@interface TMASearchCityViewController ()

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *items;
@property (nonatomic, strong) UISearchBar *searchBar;

@end

@implementation TMASearchCityViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.view = self.tableView;
    
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.tableView.frame), 44)];
    self.searchBar.delegate = self;
    [self.searchBar setShowsCancelButton:YES];
    self.tableView.tableHeaderView = self.searchBar;
    
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissKeyboard)];
    [self.tableView addGestureRecognizer:gesture];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.searchBar becomeFirstResponder];
    [self.eventHandler presentHistory];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self dismissKeyboard];
}

- (void)dismissKeyboard
{
    [self.searchBar resignFirstResponder]; 
}

#pragma mark - UISearchBarDelegate

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{
    [self dismissKeyboard];
    searchBar.text = @"";
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (searchText.length != 0)
    {
        [self.eventHandler findCities:searchText];
    }
    else
    {
        [self.eventHandler presentHistory];
    }
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.eventHandler presentCity:searchBar.text];
}

#pragma mark - TMASearchCityViewInterface

- (void)showUpcomingDisplayData:(NSArray *)data
{
    self.items = data;
    [self.tableView reloadData];
}

#pragma mark - UITableViewDelegate and DataSource Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.textLabel.text = self.items[indexPath.row];
    
    return cell;
}

@end