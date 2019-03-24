package service;

import dao.CustomerMapper;
import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author zengjia
 * @date 2019/3/6 17:13
 */
@Service
public class CustomerService {
    @Autowired
    CustomerMapper customerMapper;

    public void addCustomer(Customer customer) {
        customerMapper.insert(customer);
    }

    public void deleteCustomerById(Integer customerId) {
        customerMapper.deleteByPrimaryKey(customerId);
    }

    public void editCustomer(Customer customer) {
        customerMapper.updateByPrimaryKeySelective(customer);
    }

    public Customer getCustomer(Integer customerId) {
        Customer customer = customerMapper.selectByPrimaryKey(customerId);
        return customer;
    }

    public List<Customer> getCustomers() {
        List<Customer> customers = customerMapper.selectByExample(null);
        return customers;
    }

}
