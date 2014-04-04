//
//  detalleContradiccionHome.m
//  contradiccion
//
//  Created by alejandro on 4/4/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "detalleContradiccionHome.h"

@interface detalleContradiccionHome ()
@property (nonatomic, strong) IBOutlet UITextField *tituloInicial;

@end

@implementation detalleContradiccionHome


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
    self.tituloInicial.text =@"uno";
    NSLog(@"Título actual %@",self.tituloInicial.text);

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)configurarTituloConTexto:(NSString *)eltitulo{
    
    NSLog(@"configurando el título");
   
    NSLog(@"Título actual %@",self.tituloInicial.text);
    NSLog(@"El título fue:%@",eltitulo);
    NSLog(@"título configurado");
   self.tituloInicial.text =@"uno";
    NSLog(@"Título después de la configuración %@",self.tituloInicial.text);
    
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
