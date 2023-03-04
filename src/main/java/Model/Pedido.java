package Model;

import java.util.Date;

public class Pedido {
    private int id_pedido;
    private int id_cliente;
    private Cliente cliente;
    private String fecha;
    private double total;
    private String estado;

    public Pedido() {
    }

    public Pedido(int id_pedido, int id_cliente, Cliente cliente, String fecha, double total, String estado) {
        this.id_pedido = id_pedido;
        this.id_cliente = id_cliente;
        this.cliente = cliente;
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

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
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

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
}
