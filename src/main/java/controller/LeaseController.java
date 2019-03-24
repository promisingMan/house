package controller;

import entity.Build;
import entity.Customer;
import entity.Lease;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.MatrixVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.BuildService;
import service.CustomerService;
import service.LeaseService;
import sun.misc.VM;
import util.ConstantUtil;

import java.util.List;

/**
 * @author zengjia
 * @date 2019/3/11 21:17
 */
@Controller
@RequestMapping("/lease")
public class LeaseController {
    @Autowired
    LeaseService leaseService;

    @Autowired
    BuildService buildService;

    @Autowired
    CustomerService customerService;

    @RequestMapping("/addLease")
    public ModelAndView addLease() {
        List<Build> builds = buildService.getBuilds();
        List<Customer> customers = customerService.getCustomers();
        ModelAndView mv = new ModelAndView();
        mv.addObject("builds", builds);
        mv.addObject("customers", customers);
        mv.setViewName(ConstantUtil.ADD_LEASE);
        return mv;
    }

    @RequestMapping("/deleteLease")
    public ModelAndView deleteLease(Integer leaseId) {
        ModelAndView mv = new ModelAndView();
        leaseService.deleteLeaseById(leaseId);
        List<Lease> leases = leaseService.getLeases();
        mv.addObject("leases", leases);
        mv.setViewName(ConstantUtil.LIST_LEASES);
        return mv;
    }

    @RequestMapping("/editLease")
    public ModelAndView editLease(Integer leaseId) {
        Lease lease = leaseService.getLease(leaseId);
        List<Build> builds = buildService.getBuilds();
        List<Customer> customers = customerService.getCustomers();
        ModelAndView mv = new ModelAndView();
        mv.addObject("lease", lease);
        mv.addObject("builds", builds);
        mv.addObject("customers", customers);
        mv.setViewName(ConstantUtil.EDIT_LEASE);
        return mv;
    }

    @RequestMapping("/listLeases")
    public ModelAndView listLeases() {
        ModelAndView mv = new ModelAndView();
        List<Lease> leases = leaseService.getLeases();
        mv.addObject("leases", leases);
        mv.setViewName(ConstantUtil.LIST_LEASES);
        return mv;
    }

    @RequestMapping("/saveLease")
    public ModelAndView saveLease(Lease lease, String type) {
        ModelAndView mv = new ModelAndView();
        if (ConstantUtil.ADD.equals(type)) {
            leaseService.addLease(lease);
        } else {
            leaseService.editLease(lease);
        }
        List<Lease> leases = leaseService.getLeases();
        mv.addObject("leases", leases);
        mv.setViewName(ConstantUtil.LIST_LEASES);
        return mv;
    }
}
