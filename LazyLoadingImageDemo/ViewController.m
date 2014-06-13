//
//  ViewController.m
//  LazyLoadingImageDemo
//
//  Created by TheAppGuruz-iOS-103 on 14/05/14.
//  Copyright (c) 2014 TheAppGuruz. All rights reserved.
//

#import "ViewController.h"
#import "UIImageView+WebCache.h"

@interface ViewController ()
{
    NSArray *arrImagesUrl;
}
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    arrImagesUrl = [[NSArray alloc] initWithObjects:
                    @"http://static2.dmcdn.net/static/video/974/848/51848479:jpeg_preview_small.jpg?20121105222657",
                    @"http://static2.dmcdn.net/static/video/274/848/51848472:jpeg_preview_small.jpg?20121105222644",
                    @"http://static2.dmcdn.net/static/video/954/848/51848459:jpeg_preview_small.jpg?20121105222637",
                    @"http://static2.dmcdn.net/static/video/554/848/51848455:jpeg_preview_small.jpg?20121105222615",
                    @"http://static2.dmcdn.net/static/video/944/848/51848449:jpeg_preview_small.jpg?20121105222558",
                    @"http://static2.dmcdn.net/static/video/144/848/51848441:jpeg_preview_small.jpg?20121105222556",
                    @"http://static2.dmcdn.net/static/video/134/848/51848431:jpeg_preview_small.jpg?20121105222539",
                    @"http://static2.dmcdn.net/static/video/624/848/51848426:jpeg_preview_small.jpg?20121105222523",
                    @"http://static2.dmcdn.net/static/video/281/448/51844182:jpeg_preview_small.jpg?20121105222502",
                    @"http://static2.dmcdn.net/static/video/414/848/51848414:jpeg_preview_small.jpg?20121105222516",
                    @"http://static2.dmcdn.net/static/video/171/848/51848171:jpeg_preview_small.jpg?20121105223449",
                    @"http://static2.dmcdn.net/static/video/904/848/51848409:jpeg_preview_small.jpg?20121105222514",
                    @"http://static2.dmcdn.net/static/video/004/848/51848400:jpeg_preview_small.jpg?20121105222443",
                    @"http://static2.dmcdn.net/static/video/693/848/51848396:jpeg_preview_small.jpg?20121105222439",
                    @"http://static2.dmcdn.net/static/video/401/848/51848104:jpeg_preview_small.jpg?20121105222832",
                    @"http://static2.dmcdn.net/static/video/957/648/51846759:jpeg_preview_small.jpg?20121105223109",
                    @"http://static2.dmcdn.net/static/video/603/848/51848306:jpeg_preview_small.jpg?20121105222324",
                    @"http://static2.dmcdn.net/static/video/990/848/51848099:jpeg_preview_small.jpg?20121105222807", nil];
	
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView Delegate Methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrImagesUrl.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"Image #%d", indexPath.row];
    cell.imageView.contentMode = UIViewContentModeScaleAspectFill;
    
    [cell.imageView setImageWithURL:[NSURL URLWithString:[arrImagesUrl objectAtIndex:indexPath.row]]
                   placeholderImage:[UIImage imageNamed:@"placeholder.png"]];
    return cell;
}

@end
