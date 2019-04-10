package com.atguigu.crud.bean;

import org.hibernate.validator.constraints.Email;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    @Pattern(regexp = "(^\\w{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "用户名格式不正确！6-15位数字字母下划线或者2-6位中文")
    private String epmName;

    private String gender;

    @Pattern(regexp = "^[a-z\\d]+(\\.[a-z\\d]+)*@([\\da-z](-[\\da-z])?)+(\\.{1,2}[a-z]+)+$",message = "邮箱格式不正确！")
    private String email;

    private Integer dId;

    private Department department;

    public Employee() {
    }

    public Employee(Integer empId, String epmName, String gender, String email, Integer dId) {
        this.empId = empId;
        this.epmName = epmName;
        this.gender = gender;
        this.email = email;
        this.dId = dId;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEpmName() {
        return epmName;
    }

    public void setEpmName(String epmName) {
        this.epmName = epmName == null ? null : epmName.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }
}