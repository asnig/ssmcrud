package com.atguigu.crud.test;

import com.atguigu.crud.bean.Employee;
import com.github.pagehelper.PageInfo;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.ArrayList;
import java.util.List;

/**
 * @author 10727
 */
@SuppressWarnings("AlibabaClassNamingShouldBeCamel")
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:spring/application-context.xml", "classpath:spring/mvc-servlet.xml"})
public class MVCTest {
    @Autowired
    WebApplicationContext context;
    MockMvc mockMvc;

    @Test
    public void mvcTest() throws Exception {
        MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
        MockHttpServletRequest request = result.getRequest();
        PageInfo<Employee> pageInfo = (PageInfo<Employee>) request.getAttribute("pageInfo");
        System.out.println(pageInfo.getPageNum());
        System.out.println(pageInfo.getPages());
        System.out.println(pageInfo.getTotal());
        int[] pns = pageInfo.getNavigatepageNums();
        for (int i : pns) {
            System.out.print(" "+i);
        }
        List<Employee> emps = pageInfo.getList();
        for (Employee emp : emps) {
            System.out.println(emp.getEmpId()+"==>"+emp.getEpmName());
        }
    }
    @Before
    public void init() {
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }

}
