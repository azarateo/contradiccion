//
//  contradiccionViewController.m
//  contradiccion
//
//  Created by azarateo on 30/03/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "contradiccionViewController.h"

@interface contradiccionViewController ()

@property (strong,nonatomic) NSArray *arreglo;

@end

@implementation contradiccionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *datos = [[NSArray alloc] initWithObjects:@"Programa de prevención",@"Campaña de educación en tratamiento de las drogas", nil];
    self.arreglo = datos;
    
    
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return  1;

}

-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return [_arreglo count];

}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{

    return [_arreglo objectAtIndex:row];

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
