package clases;

public class Direccion {
    public Integer id_direccion; 
    public String calle; 
    public String numero; 
    public String codigo_postal; 
    public String municipio; 
    public String estado; 
    public String datos_adicionales; 

    public Direccion(Integer id_direccion, String calle, String numero, String codigo_postal, String municipio, String estado,String datos_adicionales) {
         this.id_direccion=id_direccion;
         this.calle=calle;
         this.numero=numero;
         this.codigo_postal=codigo_postal;
         this.municipio=municipio;
         this.datos_adicionales=datos_adicionales;
    }
}
