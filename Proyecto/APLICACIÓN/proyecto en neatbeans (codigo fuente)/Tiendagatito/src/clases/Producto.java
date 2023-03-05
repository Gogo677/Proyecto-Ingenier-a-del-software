package clases;

public class Producto {
    Integer id_producto;
    String nombre;
    String descripcion;
    String precio;
    String marca;
    
    public Producto(Integer id_producto, String nombre,String descripcion, String precio, String marca){
        this.nombre=nombre;
        this.id_producto=id_producto;
        this.descripcion=descripcion;
        this.precio=precio;
        this.marca=marca;
    }
    
    public String cadenaProducto(){
        return ("Nombre: "+nombre+"\t Marca: "+marca+"\t Precio: "+precio);
    }
    
    public Integer getId_producto(){
        return id_producto;
    }
    
    public String getPrecio(){
        return precio;
    }
}
