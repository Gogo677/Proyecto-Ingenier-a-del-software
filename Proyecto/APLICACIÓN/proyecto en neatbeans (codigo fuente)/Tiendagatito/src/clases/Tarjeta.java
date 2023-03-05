package clases;

public class Tarjeta {
    private Integer id_tarjeta;
    private String numero_tarjeta;
    private String fecha_exp;
    
    public Tarjeta(Integer id_tarjeta,String numero_tarjeta,String fecha_exp){
        this.id_tarjeta=id_tarjeta;
        this.numero_tarjeta=numero_tarjeta;
        this.fecha_exp=fecha_exp;
    }
   
    public String getNumeroTarjeta(){
        return numero_tarjeta;
    }
    
    public String getFechaExp(){
        return fecha_exp;
    }
    
    public Integer getId_tarjeta(){
        return id_tarjeta;
    }
}
