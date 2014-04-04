//
//  detalleContradiccionHome.m
//  contradiccion
//
//  Created by alejandro on 4/4/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "detalleContradiccionHome.h"

@interface detalleContradiccionHome ()

@end

@implementation detalleContradiccionHome
@synthesize titulo= _titulo;

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
    _titulo.text = @"prueba";
    NSLog(@"Título actual %@",self.titulo.text);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)configurarTituloConTexto:(NSString *)eltitulo{
    
    NSLog(@"configurando el título");
    [self.titulo setText:eltitulo];
    _titulo.text = eltitulo;
    NSLog(@"Título actual %@",self.titulo.text);
    NSLog(@"El título fue:%@",eltitulo);
    NSLog(@"título configurado");
    
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
