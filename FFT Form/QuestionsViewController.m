
#import "QuestionsViewController.h"



@implementation QuestionsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.myData = [[NSMutableArray alloc]initWithObjects:
                   @"Extremely likely",@"Likely",@"Neither likely nor unlikely",
                   @"Unlikely",@"Extremely unlikely",@"Dont Know"
                   , nil];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return self.myData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    NSString *cellIdent = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdent];
    
    if(cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdent];
    
    cell.textLabel.text = [self.myData objectAtIndex:indexPath.row];
    if([self.selectedItem isEqualToString:indexPath]) { cell.accessoryType = UITableViewCellAccessoryCheckmark; } else { cell.accessoryType = UITableViewCellAccessoryNone; }
    
    return cell;
    
    
    
    
    
}

// Default is 1 if not implemented
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle;
    if (section==0) {
        headerTitle = @"Section 1 Header";
    }
    return headerTitle;
}


#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    if(cell.accessoryType == UITableViewCellAccessoryNone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedItem=indexPath;
        NSLog(@"selected item:%@",self.selectedItem);
    }
    else {
        cell.accessoryType = UITableViewCellAccessoryNone;
        
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
@end
