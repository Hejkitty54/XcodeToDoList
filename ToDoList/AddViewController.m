//
//  AddViewController.m
//  ToDoList
//
//  Created by ITHS on 2016-02-13.
//  Copyright © 2016 Kozue Wendén. All rights reserved.
//

#import "AddViewController.h"

@interface AddViewController ()

@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) NSString *important;
@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.important=@"no";
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addButton:(id)sender {
    
    NSMutableDictionary *dictionary = [[NSMutableDictionary alloc] init];
    [dictionary setObject:self.text.text forKey:@"text"];
    [dictionary setObject:@"" forKey:@"importance"];
    
    if ([self.important isEqualToString:@"yes"]) {
        [dictionary setObject:@"yes" forKey:@"importance"];
    }else{
        [dictionary setObject:@"no" forKey:@"importance"];

    }
    
    
    [self.list addObject:dictionary];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"%@",[dictionary objectForKey:@"importance"]);
    
}
- (IBAction)addImportance:(id)sender {
    self.important=@"yes";
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
