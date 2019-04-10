package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.EmployeeService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 10727
 */
@RestController
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;


    @DeleteMapping("/emps")
    public Msg deleteEmps(@RequestBody String empIds) {
        String temp = empIds.substring(empIds.indexOf('=') + 1);
        String[] nEmpIds = temp.split("%2C");
        List<Integer> ids = new ArrayList<>();
        for (String nEmpId : nEmpIds) {
            ids.add(Integer.valueOf(nEmpId));
        }
        employeeService.deleteBatch(ids);
        return Msg.ok();
    }

    @DeleteMapping("/emps/{id}")
    public Msg deleteEmp(@PathVariable("id") Integer id) {
        employeeService.deleteEmp(id);
        return Msg.ok();
    }

    @RequestMapping("/checkUse")
    public Msg checkUse(String epmName) {
        String regex1 = "(^\\w{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})";
        if (!epmName.matches(regex1)) {
            return Msg.error().add("val_msg", "用户名格式不正确！6-15位数字字母下划线或者2-6位中文");
        }
        Boolean b = employeeService.checkUse(epmName);
        if (b) {
            return Msg.ok();
        } else {
            return Msg.error().add("val_msg", "用户已存在！");
        }
    }

    @RequestMapping(value = "/emps/{id}", method = RequestMethod.GET)
    public Msg getEmp(@PathVariable("id") Integer id) {
        Employee employee = employeeService.getEmp(id);
        return Msg.ok().add("emp", employee);
    }

    @RequestMapping(value = "/emps", method = RequestMethod.POST)
    public Msg saveEmp(@Valid Employee emp, BindingResult result) {
        Map<String, String> errorMap = new HashMap<>(10);
        if (result.hasErrors()) {
            List<FieldError> fieldErrors = result.getFieldErrors();
            for (FieldError fieldError : fieldErrors) {
                errorMap.put(fieldError.getField(), fieldError.getDefaultMessage());
            }
            return Msg.error().add("errorMap", errorMap);
        } else {
            employeeService.saveEmp(emp);
            return Msg.ok();
        }
    }

    @RequestMapping(value = "/emps/{empId}", method = RequestMethod.PUT)
    public Msg updateEmp(Employee employee) {
        employeeService.updateEmp(employee);
        return Msg.ok();
    }

    @RequestMapping("/emps")
    public Msg ajaxEmps(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {
        PageHelper.startPage(pageNo, 5);
        List<Employee> emps = employeeService.getAll();
        PageInfo<Employee> page = new PageInfo<>(emps, 5);
        return Msg.ok().add("pageInfo", page);
    }
}
