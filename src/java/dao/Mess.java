/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author NCM
 */
public class Mess {

    private int id;
    private String noidung;
    private String idre;
    private String idsend;

    public Mess(int id, String idre, String noidung, String idsend) {
        this.id = id;
        this.noidung = noidung;
        this.idre = idre;
        this.idsend = idsend;
    }

    public String getIdsend() {
        return idsend;
    }

    public void setIdsend(String idsend) {
        this.idsend = idsend;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNoidung() {
        return noidung;
    }

    public void setNoidung(String noidung) {
        this.noidung = noidung;
    }

    public String getIdre() {
        return idre;
    }

    public void setIdre(String idre) {
        this.idre = idre;
    }

}
