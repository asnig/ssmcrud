package com.atguigu.crud.service;

import com.atguigu.crud.bean.Department;
import com.atguigu.crud.dao.DepartmentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author XYQ
 * @create 2019/4/7 22:11
 */
@Service
public class DepartmentService {
    @Autowired
    private DepartmentMapper departmentMapper;

    public List<Department> getDepts() {
        return departmentMapper.selectByExample(null);
    }
}
