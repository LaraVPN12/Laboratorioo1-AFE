
package Model;

import java.sql.Date;

public class Pedido {
     private int id_pedido;
    private int id_cliente;
    private Date fecha;
    private double total;
    private String estado;
    
    public Pedido(){}

    public Pedido(int id_pedido, int id_cliente, Date fecha, double total, String estado) {
        this.id_pedido = id_pedido;
        this.id_cliente = id_cliente;
        this.fecha = fecha;
        this.total = total;
        this.estado = estado;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public double getTotal() {
        return total;
    }

    public void setTotal(double total) {
        this.total = total;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
}
