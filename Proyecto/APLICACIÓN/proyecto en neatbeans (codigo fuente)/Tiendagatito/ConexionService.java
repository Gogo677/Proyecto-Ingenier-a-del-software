import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * Clase para realizar una conexion a la BD.
 * La BD que se utilizo fue la de colectores
 */
public class ConexionService {
	
	static Connection conexion=null;
	
	public static void main(String args[]) throws SQLException{
		
		ConexionService load= new ConexionService();
		try {
			
			Class.forName("org.postgresql.Driver");	//nombre del driver para conectarse a la BD	
	        String servidor = "jdbc:postgresql://127.0.0.1:5435/mex2"; //ip:puerto/nombreBD
	        String usuarioDB="postgres";//usuario de la BD
	        String passwordDB="postgres";//contraseña de la BD
	        
	        conexion= DriverManager.getConnection(servidor,usuarioDB,passwordDB);//obtiene la conexion a la BD y se lo asigna al objeto conexion del tipo Connection
	        
	        //consulta select
	        load.search("ME");
	        
	        //insert
	        load.insertar("NUEVOOOOO");
	        
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(conexion!=null)//si la conexion es diferente de null, la cierra. Es importante que la conexion a la BD se cierre despues de usarla
				conexion.close();
			
		}
	}	
	
	public boolean search(String estado) throws SQLException{
		Statement statement=null;
		ResultSet resultado;
		boolean resp=false;
		String 	query="";
		
		try {
			statement=(Statement) conexion.createStatement();	//crea el objeto statement que permitira ejecutar el query		
			
			query="select chd_estado,nukidestado"
					+" from estado"
					+" where nukidestado is not null";//esta condicion se agrega para incluir siempre el where, ya que los otros valores
			        //dependera del paso de parametros
			
			if(estado!=null && !estado.equals(""))
				query+= " and chd_estado like '%"+estado+"%'";			
			
			resultado=statement.executeQuery(query);//ejecuta el query y el resultado lo asigna al objeto resultado del tipo ResultSet
			
			while (resultado.next()) {
				System.out.println("============================================");//el orden de las columnas es como estan en el select
				System.out.println("* estado "+resultado.getString(1));//se obtiene la columna 1 que es del tipo cadena por lo cual se recupera como String
				System.out.println("* id "+resultado.getInt(2));//se obtiene la columna 6 que es del tipo numerico por lo cual se recupera como Int
				
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
	
	
	public void insertar(String estado) throws SQLException{
		Statement statement=null;
		String qry="";
		try {
			statement=(Statement) conexion.createStatement();
			qry="insert into estado (chd_estado,nukidestado)"
					+ " values('"+estado+"',"+
					"(select case when max(nukidestado) is null then 1 else max(nukidestado)+1 end from estado))";//con esta subconsulta calcula el maximo nukidestado y le suma 1, si no existe ningun registro se coloca id 1
					
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
		
	
} // end of class

