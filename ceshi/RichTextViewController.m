//
//  RichTextViewController.m
//  ceshi
//
//  Created by csc on 16/4/18.
//  Copyright © 2016年 csc. All rights reserved.
//

#import "RichTextViewController.h"
#import "RichModel.h"
#import "CSCCoreText.h"
#import "RichTextCell.h"
#import <MediaPlayer/MediaPlayer.h>
@interface RichTextViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * richTable;
    NSMutableArray * richModelArr;
}
@end

@implementation RichTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    richModelArr = [[NSMutableArray alloc]initWithCapacity:1];
    // Do any additional setup after loading the view.
    richTable = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStyleGrouped];
    richTable.delegate = self;
    richTable.dataSource = self;
    [self.view addSubview:richTable];
    
    
    
    [self createFakeData];
    
    
    NSBundle *bundle = [NSBundle mainBundle];
    NSString *moviePath = [bundle pathForResource:@"movie" ofType:@"mp4"];
    NSURL *movieURL = [NSURL fileURLWithPath:moviePath];
    
}

-(void)createFakeData
{
    NSArray * strs = @[@"RichTextBox控件允许用户输入和编辑文本的同时提供了比普通的TextBox控件更高级的格式特征。",@"RichTextBox控件提供了数个有用的特征，你可以在控件中安排文本的格式。要改变文本的格式，必须先选中该文本。只有选中的文本才可以编排字符和段落的格式。额有了这些属性，就可以设置文本使用粗体",@"RichTextBox控件提供了数个有用的特征[smile]，你可以在控件中安排文本的格式。[smile]要改变文本的格式，[cry]必须先选中该文本。只有选中的文本才可以编排字符和段落的格式。https://github.com额/有了这些属性，就可以设置文本使用粗体",@"从而调整段落的格式。 RichTextBox控件可以打开和保存RTF文件或普通的ASCII文本文件。你可以使用控件的方法（LoadFile[smile]SaveFile）直接读和写文件 RichTextBox控件使用集合支https://github.com持嵌入的对象。每个嵌入控件中的对象都表示为一个[1]对象",@"改变[cry]字体的颜色，创建超底稿和子底稿。[smile]也可以设置左右缩排或不缩排，从而调整段落的格式。 RichTextBox控件可以打开和保存RTF文件或普通的ASCII文本文件。你可以使用控件的方法（LoadFile[smile]SaveFile）直接读和写文件",@"Microsoft Word文档或任何在系统中注册的其他OLE对象的文档。要在RichTextBox控件中插入对象，可以简单地拖住一个文件（如使用Windows 95的Explorerwww.chiphell.com/或其他应用程序",@"RichTextBox控件提供了数个有用的特征[smile]，你可以在控件中安排文本的格式。[smile]要改变文本的格式，[cry]必须先选中该文本。只有选中的文本才可以编排字符和段落的格式。https://github.com额/有了这些属性，就可以设置[cry]文本使用粗体",@"每个嵌入控件中的对象都表示为一个[1]对象。这允许文档中创建的控件可以包含其他控件或文档。https://github.com/ 例如，可以创建一个包含报表",@"每个嵌入控件中的对象都表示为一个[1]对象。这允许文档中创建的控件可以包含其他控件或文档。https://github.com/ 例如，可以创建一个包含报表",@"RichTextBox控件提供了数个有用的特征[smile]，你可以在控件中安排文本的格式。[smile]要改变文本的格式，[cry]必须先选中该文本。只有选中的文本才可以编排字符和段落的格式。https://github.com额/有了这些属性，就可以设置[cry]文本使用粗体",];
    for(NSInteger i = 0 ; i<strs.count;i++)
    {
        RichModel * model1 = [[RichModel alloc]init];
        model1.attStr = strs[i];
        CGRect  rect = [CSCCoreText boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width-40, 2000) font:[UIFont systemFontOfSize:15] string:strs[i] lineSpace:15.0f];
        model1.srect = rect;
        [richModelArr addObject:model1];
    }
    [richTable reloadData];
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return richModelArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    RichModel * model = [richModelArr objectAtIndex:indexPath.section];
    NSLog(@"----------------->>>>%f",model.srect.size.height);
    return model.srect.size.height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString * cellInfo = @"cellInfo";
    RichTextCell * cell = [tableView dequeueReusableCellWithIdentifier:cellInfo];
    if(!cell)
    {
        cell = [[RichTextCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellInfo];
    }
    RichModel * model = [richModelArr objectAtIndex:indexPath.section];
    [cell setMessage:model];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // [self openmovie];
}


-(void)openmovie
{
    
    NSString *url = [[NSBundle mainBundle]pathForResource:@"movie"ofType:@"mp4"];
    MPMoviePlayerViewController *playerViewController  = [[MPMoviePlayerViewController alloc]initWithContentURL:[NSURL fileURLWithPath:url]];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(movieFinishedCallback:)
                                               name:MPMoviePlayerPlaybackDidFinishNotification
                                             object:[playerViewController moviePlayer]];
    
    [self.view addSubview:playerViewController.view];
    
    
    MPMoviePlayerController *player = [playerViewController moviePlayer];
    [player play];
    
}
- (void) movieFinishedCallback:(NSNotification*) aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:MPMoviePlayerPlaybackDidFinishNotification object:player];
    [player stop];
    [player.view removeFromSuperview];
    
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
