package controller;

import entity.Customer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.CustomerService;
import util.ConstantUtil;

import java.util.List;

/**
 * @author zengjia
 * @date 2019/3/6 17:25
 */
@Controller
@RequestMapping("/customer")
public class CustomerController {
    @Autowired
    CustomerService customerService;

    @RequestMapping("/addCustomer")
    public String addCustomer() {
        return ConstantUtil.ADD_CUSTOMER;
    }

    @RequestMapping("/delCustomer")
    public ModelAndView deleteCustomer(Integer customerId) {
        ModelAndView mv = new ModelAndView();
        customerService.deleteCustomerById(customerId);
        List<Customer> customers = customerService.getCustomers();
        mv.addObject("customers", customers);
        mv.setViewName(ConstantUtil.LIST_CUSTOMERS);
        return mv;
    }

    @RequestMapping("/editCustomer")
    public ModelAndView editCustomer(Integer customerId) {
        ModelAndView mv = new ModelAndView();
        Customer customer = customerService.getCustomer(customerId);
        mv.addObject("customer", customer);
        mv.setViewName(ConstantUtil.EDIT_CUSTOMER);
        return mv;
    }

    @RequestMapping("/listCustomers")
    public ModelAndView listCustomers() {
        ModelAndView mv = new ModelAndView();
        List<Customer> customers = customerService.getCustomers();
        mv.addObject("customers", customers);
        mv.setViewName(ConstantUtil.LIST_CUSTOMERS);
        return mv;
    }

    @RequestMapping("/saveCustomer")
    public ModelAndView saveCustomer(Customer customer, String type) {
        ModelAndView mv = new ModelAndView();
        if (ConstantUtil.ADD.equals(type)) {
            customerService.addCustomer(customer);
        } else {
            customerService.editCustomer(customer);
        }
        List<Customer> customers = customerService.getCustomers();
        mv.addObject("customers", customers);
        mv.setViewName(ConstantUtil.LIST_CUSTOMERS);
        return mv;
    }
}
