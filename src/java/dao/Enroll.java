/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author NCM
 */
public class Enroll {
    private String idclass;
    private String idacc;

    public Enroll(String idclass, String idacc) {
        this.idclass = idclass;
        this.idacc = idacc;
    }

    public String getIdclass() {
        return idclass;
    }

    public void setIdclass(String idclass) {
        this.idclass = idclass;
    }

    public String getIdacc() {
        return idacc;
    }

    public void setIdacc(String idacc) {
        this.idacc = idacc;
    }
    
}
