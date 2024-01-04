package com.example.demo.controller;


import com.example.demo.entity.CustomerEntity;
import com.example.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/customer")
public class CustomerController {

    @Autowired
    private CustomerService customerService;

    @PostMapping("/save")
    public String saveCustomer(@RequestBody CustomerEntity customer){

        try{
            customerService.saveCustomer(customer);
            return "create success";

        }catch (Exception ex){
            return ex.getMessage();
        }
    }

    @GetMapping("/getAll")
    public List<CustomerEntity> getAll(){
        List<CustomerEntity> list = new ArrayList<>();
        try {
            list = customerService.getAllCustomer();


        }catch (Exception ex){
            System.out.println(ex.getMessage());
        }
        return list;
    }
}
