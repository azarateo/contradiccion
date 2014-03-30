//
//  contradiccionHomeTVC.m
//  contradiccion
//
//  Created by azarateo on 29/03/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "contradiccionHomeTVC.h"

@interface contradiccionHomeTVC ()

@property  (strong,nonatomic) NSArray *arreglo;

@end

@implementation contradiccionHomeTVC




- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    NSURL *url = [NSURL URLWithString:@"http://servicedatosabiertoscolombia.cloudapp.net/v1/Ministerio_de_Justicia/tabladrogas?$format=json&"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"Conexión con servidor realizada");
    datos = [[NSMutableData alloc] init];
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{

    NSLog(@"descargando datos...");
    
    
    
        [datos appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection{
    
    
    NSString *datosPuros = [[NSString alloc] initWithData:datos encoding:NSUTF8StringEncoding];
    //NSLog(@"Datos sin modificar: %@", datosPuros);
    NSString *datosmejorados = [datosPuros substringFromIndex:5];
    long numerodedatos = datosmejorados.length-1;
    NSString *datosfinales = [datosmejorados substringToIndex:numerodedatos];
    //NSLog(@"Datos modificados: %@", datosfinales);
    NSLog(@"Codificación de datos a UTF8");
    NSData *losdatos = [datosfinales dataUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"Finaliza codifcaci");

    
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    arregloDatos = [NSJSONSerialization JSONObjectWithData:losdatos options:NSJSONReadingMutableContainers|NSJSONReadingMutableLeaves error:nil];
    [tablaDatos reloadData];
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{

    NSLog(@"Error en la descarga");
    UIAlertView *vistaError = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Error en la descarga" delegate:nil cancelButtonTitle:@"Cancelar" otherButtonTitles:nil];
    [vistaError show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [arregloDatos count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"elementoHome" forIndexPath:indexPath];
   //[[arregloDatos objectAtIndex:indexPath.row] objectForKey:@"d"];
    cell.textLabel.text = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:@"nombre_de_la_droga"];
    cell.detailTextLabel.text = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:@"clasificacion"];
   
    return cell;
}

/*
-(void)filterContentForSearchText:(NSString *)searchText forScope:(NSString *)scope{

    NSPredicate *predicado = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@",searchText];
    [arregloDatos filteredArrayUsingPredicate:predicado];

}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{

    [self filterContentForSearchText:searchString scope:[[self.searchDisplayController.searchBar scopeButtonTitles] objectAtIndex:[self.searchDisplayController.searchBar selectedScopeButtonIndex]]];
    return YES;

}*/

@end
