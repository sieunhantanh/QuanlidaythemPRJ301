/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

/**
 *
 * @author NCM
 */
public class Lophoc {
    private String idclass;
    private String nameclass;
   private String subject; 
   private String timestart;
   private String timeend;

    public Lophoc(String idclass, String nameclass, String subject, String timestart, String timeend) {
        this.idclass = idclass;
        this.nameclass = nameclass;
        this.subject = subject;
        this.timestart = timestart;
        this.timeend = timeend;
    }

   

    Lophoc(String IDclass, String Nameclass) {
       this.idclass = idclass;
        this.nameclass = nameclass;
    }

    public String getIdclass() {
        return idclass;
    }

    public void setIdclass(String idclass) {
        this.idclass = idclass;
    }

    public String getNameclass() {
        return nameclass;
    }

    public void setNameclass(String nameclass) {
        this.nameclass = nameclass;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getTimestart() {
        return timestart;
    }

    public void setTimestart(String timestart) {
        this.timestart = timestart;
    }

    public String getTimeend() {
        return timeend;
    }

    public void setTimeend(String timeend) {
        this.timeend = timeend;
    }


}