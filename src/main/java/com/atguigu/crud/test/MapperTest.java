package com.atguigu.crud.test;


import com.atguigu.crud.bean.Employee;
import com.atguigu.crud.dao.DepartmentMapper;
import com.atguigu.crud.dao.EmployeeMapper;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.UUID;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/application-context.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;
    @Autowired
    EmployeeMapper employeeMapper;
    @Autowired
    SqlSession sqlSession;

    /**
     * 测试DepartmentMapper
     */
    @Test
    public void testCRUD() {
        System.out.println(departmentMapper);
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        int record = 1000;
        for (int i = 0; i < record; i++) {
            String uid = UUID.randomUUID().toString().substring(0, 5);
            mapper.insertSelective(new Employee(null, uid, "M", uid + "@qq.com", 1));
        }

        System.out.println("插入完成");

    }
}
