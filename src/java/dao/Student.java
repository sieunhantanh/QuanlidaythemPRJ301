/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.Date;

/**
 *
 * @author NCM
 */
public class Student {
      private String Fullname;
    private String Firstname;
    private String Lastname;
    private String Accid;
    private String Phone;
    private String EMail;
    private String Address;
    private String Gender;
    private String Birthdate;
    private String Idstudent;


   

    public Student(String Fullname, String Firstname, String Lastname, String Accid, String Phone, String EMail, String Address, String Gender, String Birthdate, String Idstudent) {
        this.Fullname = Fullname;
        this.Firstname = Firstname;
        this.Lastname = Lastname;
        this.Accid = Accid;
        this.Phone = Phone;
        this.EMail = EMail;
        this.Address = Address;
        this.Gender = Gender;
        this.Birthdate = Birthdate;
        this.Idstudent = Idstudent;
    }

    public String getFullname() {
        return Fullname;
    }

    public void setFullname(String Fullname) {
        this.Fullname = Fullname;
    }

    public String getFirstname() {
        return Firstname;
    }

    public void setFirstname(String Firstname) {
        this.Firstname = Firstname;
    }

    public String getLastname() {
        return Lastname;
    }

    public void setLastname(String Lastname) {
        this.Lastname = Lastname;
    }

    public String getAccid() {
        return Accid;
    }

    public void setAccid(String Accid) {
        this.Accid = Accid;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getEMail() {
        return EMail;
    }

    public void setEMail(String EMail) {
        this.EMail = EMail;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String Address) {
        this.Address = Address;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getBirthdate() {
        return Birthdate;
    }

    public void setBirthdate(String Birthdate) {
        this.Birthdate = Birthdate;
    }

    public String getIdstudent() {
        return Idstudent;
    }

    public void setIdstudent(String Idstudent) {
        this.Idstudent = Idstudent;
    }
    
}
