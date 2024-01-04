package com.example.demo.service.impl;


import com.example.demo.entity.CustomerEntity;
import com.example.demo.repository.CustomerRepository;
import com.example.demo.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service

public class CustomerServiceImpl implements CustomerService {

    @Autowired
    private CustomerRepository customerRepository;

    @Override
    public void saveCustomer(CustomerEntity customer) {
        customerRepository.save(customer);
    }

    @Override
    public List<CustomerEntity> getAllCustomer() {
        return (List<CustomerEntity>) customerRepository.findAll();
    }
}
