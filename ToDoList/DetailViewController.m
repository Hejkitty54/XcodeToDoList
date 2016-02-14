//
//  DetailViewController.m
//  ToDoList
//
//  Created by ITHS on 2016-02-13.
//  Copyright © 2016 Kozue Wendén. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *showText;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.showText.text=[[self.list objectAtIndex:self.row] objectForKey:@"text"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
