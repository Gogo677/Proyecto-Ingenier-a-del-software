
package clases;

public class Usuario {
    private Integer id_usuario;
    private String nombre ;
    private String apellido_p;
    private String apellido_m;  
    private String correo;  
    private String contraseña; 
    
    public Usuario(){
        
    }
    public Usuario(Integer id_usuario,String nombre, String apellido_p,
            String apellido_m,String correo, String contraseña){
        this.id_usuario= id_usuario;
        this.nombre = nombre;
        this.apellido_p = apellido_p;
        this.apellido_m = apellido_m;
        this.correo = correo;
        this.contraseña = contraseña;
    }
    
    public void setId_usuario(Integer id_usuario){
        this.id_usuario=id_usuario;
    }
    
    public Integer getId_usuario(){
        return id_usuario;
    }
    
    
    public void setNombre(String nombre){
        this.nombre=nombre;
    }
    
    public String getNombre(){
        return this.nombre;
    }
    
    public void setApellidoMat(String apellido_m){
        this.apellido_m=apellido_m;
    }
    
    public String getApellidoMat(){
        return this.apellido_m;
    }
    public void setApellidoPat(String apellido_p){
        this.apellido_p=apellido_p;
    }
    
    public String getApellidoPat(){
        return this.apellido_p;
    }
    public void setCorreo(String correo){
        this.correo=correo;
    }
    
    public String getCorreo(){
        return this.correo;
    }
    public void setContraseña(String contraseña){
        this.contraseña=contraseña;
    }
    
    public String getContraseña(){
        return this.contraseña;
    }
}
