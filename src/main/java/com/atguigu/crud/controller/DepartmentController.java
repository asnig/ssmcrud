package com.atguigu.crud.controller;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.bean.Msg;
import com.atguigu.crud.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 处理和部门有关的请求
 *
 * @Author XYQ
 * @create 2019/4/7 22:10
 */
@Controller
public class DepartmentController {
    @Autowired
    private DepartmentService departmentService;

    @ResponseBody
    @RequestMapping("/depts")
    public Object getDepts() {
        List<Department> depts = departmentService.getDepts();
        return Msg.ok().add("depts", depts);
    }
}
