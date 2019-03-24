package controller;

import entity.Build;
import entity.Customer;
import entity.Sell;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import service.BuildService;
import service.CustomerService;
import service.SellService;
import util.ConstantUtil;

import java.util.List;

/**
 * @author zengjia
 * @date 2019/3/11 21:17
 */
@Controller
@RequestMapping("/sell")
public class SellController {
    @Autowired
    SellService sellService;

    @Autowired
    BuildService buildService;

    @Autowired
    CustomerService customerService;

    @RequestMapping("/addSell")
    public ModelAndView addSell() {
        List<Build> builds = buildService.getBuilds();
        List<Customer> customers = customerService.getCustomers();
        ModelAndView mv = new ModelAndView();
        mv.addObject("builds", builds);
        mv.addObject("customers", customers);
        mv.setViewName(ConstantUtil.ADD_SELL);
        return mv;
    }

    @RequestMapping("/deleteSell")
    public ModelAndView deleteSell(Integer sellId) {
        ModelAndView mv = new ModelAndView();
        sellService.deleteSellById(sellId);
        List<Sell> sells = sellService.getSells();
        mv.addObject("sells", sells);
        mv.setViewName(ConstantUtil.LIST_SELLS);
        return mv;
    }

    @RequestMapping("/editSell")
    public ModelAndView editSell(Integer sellId) {
        Sell sell = sellService.getSell(sellId);
        List<Build> builds = buildService.getBuilds();
        List<Customer> customers = customerService.getCustomers();
        ModelAndView mv = new ModelAndView();
        mv.addObject("sell", sell);
        mv.addObject("builds", builds);
        mv.addObject("customers", customers);
        mv.setViewName(ConstantUtil.EDIT_SELL);
        return mv;
    }

    @RequestMapping("/listSells")
    public ModelAndView listSells() {
        ModelAndView mv = new ModelAndView();
        List<Sell> sells = sellService.getSells();
        mv.addObject("sells", sells);
        mv.setViewName(ConstantUtil.LIST_SELLS);
        return mv;
    }

    @RequestMapping("/saveSell")
    public ModelAndView saveSell(Sell sell, String type) {
        ModelAndView mv = new ModelAndView();
        if (ConstantUtil.ADD.equals(type)) {
            sellService.addSell(sell);
        } else {
            sellService.editSell(sell);
        }
        List<Sell> sells = sellService.getSells();
        mv.addObject("sells", sells);
        mv.setViewName(ConstantUtil.LIST_SELLS);
        return mv;
    }
}
