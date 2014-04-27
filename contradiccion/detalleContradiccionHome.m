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
@synthesize titulo;
@synthesize subtitulo;
@synthesize campoTextoTitulo;
@synthesize campoSubtitulo;


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self actualizarUI];
}
-(void)actualizarUI{
    self.campoTextoTitulo.text = titulo;
    self.campoSubtitulo.text = subtitulo;

}


@end
