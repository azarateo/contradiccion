//
//  contradiccionTableViewController2.m
//  contradiccion
//
//  Created by azarateo on 29/03/14.
//  Copyright (c) 2014 azarateo. All rights reserved.
//

#import "contradiccionTableViewController2.h"

@interface contradiccionTableViewController2 ()

@end

@implementation contradiccionTableViewController2

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
    NSURL *url = [NSURL URLWithString:@"http://servicedatosabiertoscolombia.cloudapp.net/v1/Ministerio_de_Justicia/informacionprogramas?$format=json&"];
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
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"celda2" forIndexPath:indexPath];
    //[[arregloDatos objectAtIndex:indexPath.row] objectForKey:@""];
    
    //cell.textLabel.text = @"Hola";
    
    cell.textLabel.text = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:@"tipo_de_informacion"];
    cell.detailTextLabel.text = [[arregloDatos objectAtIndex:indexPath.row] objectForKey:@"programa"];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
