package controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import model.Student;
import dao.StudentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
@Controller
public class JSONController {
   
    @Autowired
    StudentDao sdao;
    @RequestMapping("json")
    public ModelAndView JsonView(){
        ModelAndView m =new ModelAndView("Json/Index");
        return m;
    }
    
    @RequestMapping(value = "studentlist")
    public @ResponseBody List<Student> GetAll(){
        
        List<Student>lst=sdao.GetStudents();
        return lst;
    }
    
    @RequestMapping(value = "getstudent/{id}",method = RequestMethod.GET)
    public @ResponseBody Student GetStudent(@PathVariable("id")int id)
    {
        Student st=sdao.GetStudent(id);
        return st;
    }
    
    @RequestMapping(value = "addstudent" , method =RequestMethod.POST )
    public @ResponseBody Student AddStudent(@RequestBody Student st){
        sdao.AddStudent(st);
        return st;
    }
    
    @RequestMapping(value = "updatestudent" , method =RequestMethod.POST )
    public @ResponseBody Student UpdateStudent(@RequestBody Student st){
        sdao.UpdateStudent(st);
        return st;
    }
    
    @RequestMapping(value = "deletestudent/{id}",method = RequestMethod.POST)
    public @ResponseBody Student DeleteStudent(@PathVariable("id")int id)
    {
        Student st=sdao.GetStudent(id);
        sdao.DeleteStudent(id);
        return st;
    }
}
