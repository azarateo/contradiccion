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
@synthesize textoTitulo = _textoTitulo;
@synthesize tituloInicial = _tituloInicial;

- (id)init
{
    self = [super init];
    _textoTitulo = @"Inicio";
    _tituloInicial.text = _textoTitulo;
    
    return self;
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    [self actualizarUI];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)actualizarUI{
    
          self.tituloInicial.text = _textoTitulo;
    
}


@end
