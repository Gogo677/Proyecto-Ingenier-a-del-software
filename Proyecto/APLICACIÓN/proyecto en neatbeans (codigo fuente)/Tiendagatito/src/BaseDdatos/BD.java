package BaseDdatos;



import clases.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Properties;

import javax.swing.JOptionPane;

public final class BD 
{
    static Connection conectar=null;
    static String bdt= null;
    static String usuario=null;
    static String pass=null;   
    
    public BD(){
        cargaConfiguracion();
    }
    
    
    public void conecta() throws SQLException{
    BD load = new BD();
               
        try {
            conectar=DriverManager.getConnection(bdt,usuario,pass);
            
            
            load.search("Diego");
        } catch (SQLException e) {
        	System.out.println("error al conectar");
        }finally {
	        if(conectar!=null)
	                conectar.close();
        }
    }
    
    public void conectaActualizaUsuario(Usuario us) throws SQLException{
    BD load = new BD();
               
        try {
            conectar=DriverManager.getConnection(bdt,usuario,pass);
            
            load.actualizaUsuario(us);
            
        } catch (SQLException e) {
        	System.out.println("error al conectar");
        }finally {
	        if(conectar!=null)
	                conectar.close();
        }
    }
    
    public void conectaEliminaUsuario(Usuario us) throws SQLException{
    BD load = new BD();
               
        try {
            conectar=DriverManager.getConnection(bdt,usuario,pass);
            
            load.eliminaUsuario(us);
            
        } catch (SQLException e) {
        	System.out.println("error al conectar");
        }finally {
	        if(conectar!=null)
	                conectar.close();
        }
    }
    
    public void conectaDefinitivo(Usuario us,Direccion direccion,Tarjeta tarjeta) throws SQLException{
    BD load = new BD();
               
        try {
            conectar=DriverManager.getConnection(bdt,usuario,pass);
            
            if(direccion!=null){
                insertaDireccion(us,direccion);
            }else{
                insertaTarjeta(us,tarjeta);
            }
            
        } catch (SQLException e) {
        	System.out.println("error al conectar");
        }finally {
	        if(conectar!=null)
	                conectar.close();
        }
    }
    
    
    public Usuario conectaInicioSesion(String correo,String contraseña) throws SQLException{
    BD load = new BD();
    Usuario usuario = null;             
        try {
            conectar=DriverManager.getConnection(bdt,this.usuario,pass);
            
            
            //load.searchInicioSesion(correo,contraseña,usuario);
            usuario=load.searchInicioSesion(correo,contraseña);
        } catch (SQLException e) {
        	System.out.println("error al conectar");
        }finally {
	        if(conectar!=null)
	                conectar.close();
        }
        return usuario;
    }
    
    public void conectaInsertaUsuario(Usuario us) throws SQLException{
    BD load = new BD();
               
        try {
            conectar=DriverManager.getConnection(bdt,usuario,pass);
            
            
            insertarUsuario(us);
            
        } catch (SQLException e) {
        	System.out.println("error al conectar");
        }finally {
	        if(conectar!=null)
	                conectar.close();
        }
    }
    
    public void conectaListaProductos(List<Producto> listaProductos,String filtro,int filtroTipo) throws SQLException{
    BD load = new BD();
               
        try {
            conectar=DriverManager.getConnection(bdt,usuario,pass);
            
            
            load.listaProductos(listaProductos,filtro,filtroTipo);
        } catch (SQLException e) {
        	System.out.println("error al conectar");
        }finally {
	        if(conectar!=null)
	                conectar.close();
        }
    }
    
    
    private boolean search(String usuario) throws SQLException
    {
		Statement statement=null;
		ResultSet resultado;
		boolean resp=false;
		String 	query;
		
		try {
			statement=(Statement) conectar.createStatement();	//crea el objeto statement que permitira ejecutar el query		
			
			query="select nombre,id_usuario"
					+" from usuario"
					+" where id_usuario is not null";//esta condicion se agrega para incluir siempre el where, ya que los otros valores
			        //dependera del paso de parametros
			
			if(usuario!=null && !usuario.equals(""))
				query+= " and nombre like '%"+usuario+"%'";			
			System.out.println(query);
			resultado=statement.executeQuery(query);//ejecuta el query y el resultado lo asigna al objeto resultado del tipo ResultSet

			while (resultado.next()) {
				//System.out.println("============================================");//el orden de las columnas es como estan en el select
				//System.out.println("* estado "+resultado.getString(1));
				//System.out.println("* id "+resultado.getInt(2));
				JOptionPane.showMessageDialog(null, "Nombre: "+resultado.getString(1));
				JOptionPane.showMessageDialog(null, "ID: "+resultado.getString(2));

            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
		return resp;
	}

    
    private Usuario searchInicioSesion(String correo,String contraseña) throws SQLException
    {
		Statement statement=null;
		ResultSet resultado;
                Usuario us=null;
		String 	query;
                
		
		try {
			statement=(Statement) conectar.createStatement();	//crea el objeto statement que permitira ejecutar el query		
			
			query="select id_usuario,nombre, apellido_p, apellido_m,correo,contraseña"
					+" from usuario"
					+" where id_usuario is not null";//esta condicion se agrega para incluir siempre el where, ya que los otros valores
			        //dependera del paso de parametros
			
			if(correo!=null && !correo.equals("") && contraseña!=null && !contraseña.equals(""))
				query+= " and correo = '"+correo+"'";
                                query+= " and contraseña = '"+contraseña+"'";
			System.out.println(query);
			resultado=statement.executeQuery(query);//ejecuta el query y el resultado lo asigna al objeto resultado del tipo ResultSet

			while (resultado.next()) {
                                us = new Usuario();
 
                                us.setId_usuario(resultado.getInt(1));
                                us.setNombre(resultado.getString(2));
                                us.setApellidoPat(resultado.getString(3));
                                us.setApellidoMat(resultado.getString(4));
                                us.setCorreo(resultado.getString(5));
                                us.setContraseña(resultado.getString(6));
            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
		return us;
	}
    
    private void listaProductos(List<Producto> listaProd,String filtro,int filtroTipo) throws SQLException
    {
		Statement statement=null;
		ResultSet resultado;
		String 	query;
                
		
		try {
			statement=(Statement) conectar.createStatement();	//crea el objeto statement que permitira ejecutar el query		
			
			query="select id_producto, nombre, descripcion, precio, marca.nombre_marca"
					+" from producto, marca"
					+" where id_producto is not null"
                                +" and producto.id_marca = marca.id_marca";//esta condicion se agrega para incluir siempre el where, ya que los otros valores
			        //dependera del paso de parametros
                                if(filtro!=null && !filtro.equals(""))
                                {
                                    query+=" and nombre like '%"+filtro+"%'";
                                }
                                //filtro tipo 0 es todo
                                if(filtroTipo==1){
                                    query+=" and id_producto in (select id_producto from ropa)";
                                }
                                if(filtroTipo==2){
                                    query+=" and id_producto in (select id_producto from accesorios)";
                                }
			System.out.println(query);
			resultado=statement.executeQuery(query);//ejecuta el query y el resultado lo asigna al objeto resultado del tipo ResultSet

			while (resultado.next()) {
                                listaProd.add(new Producto(resultado.getInt(1),resultado.getString(2),resultado.getString(3),
                                resultado.getString(4),resultado.getString(5)));

            }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
		
	}
    
    public void insertarUsuario(Usuario us) throws SQLException{
		Statement statement=null;
		String qry="";
		try {
			statement=(Statement) conectar.createStatement();
			qry="insert into usuario (id_usuario, nombre, apellido_p, apellido_m, correo, contraseña)"
					+ " values((select max(id_usuario)+1 from usuario),'"+us.getNombre()+"','"+us.getApellidoPat()+"','"+
                               us.getApellidoMat()+"','"+us.getCorreo()+"','"+us.getContraseña()+"')";//con esta subconsulta calcula el maximo nukidestado y le suma 1, si no existe ningun registro se coloca id 1
					
			System.out.println("qry "+qry);
			statement.execute(qry);//ejecuta el qry
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
	}
    public void actualizaUsuario(Usuario us) throws SQLException{
		Statement statement=null;
		String qry="";
		try {
			statement=(Statement) conectar.createStatement();
			qry="update usuario set"
					+ " nombre='"+us.getNombre()+"', apellido_p='"+us.getApellidoPat()+"',apellido_m='"+
                               us.getApellidoMat()+"',correo='"+us.getCorreo()+"',contraseña='"+us.getContraseña()+"' where id_usuario ="+us.getId_usuario();//con esta subconsulta calcula el maximo nukidestado y le suma 1, si no existe ningun registro se coloca id 1
					
			System.out.println("qry "+qry);
			statement.execute(qry);//ejecuta el qry
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
	}
    
    public void eliminaUsuario(Usuario us) throws SQLException{
		Statement statement=null;
		String qry="";
		try {
			statement=(Statement) conectar.createStatement();
			qry="delete from factura where id_usuario ="+us.getId_usuario()+"; "+
                                "delete from tarjeta where id_usuario ="+us.getId_usuario()+"; "+
                                "delete from usuario_direccion where id_usuario ="+us.getId_usuario()+"; "+
                                "delete from usuario where id_usuario ="+us.getId_usuario();//con esta subconsulta calcula el maximo nukidestado y le suma 1, si no existe ningun registro se coloca id 1
					
			System.out.println("qry "+qry);
			statement.execute(qry);//ejecuta el qry
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
	}
    
    
    
    private void insertaDireccion(Usuario us, Direccion dir) throws SQLException {
        Statement statement=null;
		String qry="";
		try {
			statement=(Statement) conectar.createStatement();
			qry="insert into direccion (id_direccion, calle, numero,codigo_postal, municipio, estado, datos_adicionales)"
					+ " values((select max(id_direccion)+1 from direccion),'"+dir.calle+"','"+dir.numero+"','"+
                               dir.codigo_postal+"','"+dir.municipio+"','"+dir.estado+"','"+dir.datos_adicionales+"');"+
                                " insert into usuario_direccion (id_usuario, id_direccion) values("+us.getId_usuario()+",(select max(id_direccion) from direccion));";
                        
			System.out.println("qry1:  "+qry);
			statement.execute(qry);//ejecuta el qry
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
    }

    private void insertaTarjeta(Usuario us, Tarjeta tar) throws SQLException {
        Statement statement=null;
		String qry="";
		try {
			statement=(Statement) conectar.createStatement();
			qry="insert into tarjeta (id_tarjeta,numero_tarjeta,fecha_exp,id_usuario)"
					+ " values((select max(id_tarjeta)+1 from tarjeta),'"+tar.getNumeroTarjeta()+"','"+tar.getFechaExp()+"',"+us.getId_usuario()+");";
			System.out.println("qry "+qry);
			statement.execute(qry);//ejecuta el qry
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(statement!=null)
			 statement.close();
		}
    }
    
    public void cargaConfiguracion() {
    	Properties propiedades = new Properties();
    	
    	try {
                
                    File archivo = new File("configuracion.properties");
    		InputStream is = getClass().getResourceAsStream("configuracion.properties");
                InputStream is2 = new FileInputStream(archivo);
    		propiedades.load(is2);
                
			is.close();
			is = null;
			
			bdt=propiedades.getProperty("url");
		    usuario=propiedades.getProperty("user");
		    pass=propiedades.getProperty("password");
		    
		    System.out.println("bdt: "+bdt);
		    System.out.println("usuario: "+usuario);
		    System.out.println("pass: "+pass);
			
		} catch (FileNotFoundException e) {
			System.out.println("no se encontro el archivo de configuracion");
		} catch (IOException e) {
			System.out.println("error de lectura");

		}
    	
    }
}
    
    
    
        


