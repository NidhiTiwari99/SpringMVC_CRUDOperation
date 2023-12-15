package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import model.Student;
import dao.StudentDao;
import java.util.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.view.RedirectView;

@Controller
public class StudentController {
    
    @Autowired
    StudentDao sdao;
    
//    @RequestMapping("student")
//    public ModelAndView StudentView(){
//        Student st=new Student();
//        ModelAndView m=new ModelAndView("student/index","command",st);
//        List<Student>lst=sdao.GetStudents();
//        m.addObject("students",lst);
//        m.addObject("msg","");
//        return m;
//    }
//    
//    
//     @RequestMapping(value = "student",method = RequestMethod.POST)
//    public ModelAndView AddStudentView(@ModelAttribute("st")Student stud){
//
//        sdao.AddStudent(stud);
//        Student st=new Student();
//        ModelAndView m=new ModelAndView("student/index","command",st);
//        List<Student>lst=sdao.GetStudents();
//        m.addObject("students",lst);
//        m.addObject("msg","Student Added Successfully");
//
//        return m;
//    }
//    
//    @RequestMapping(value =  "editstudent/{id}")
//    public ModelAndView EditStudent(@PathVariable("id")int rno)
//    {
//     
//        Student st=sdao.GetStudent(rno);
//        ModelAndView m=new ModelAndView("student/EditStudent","command",st);
//        return m;
//    }
//    
//     @RequestMapping(value =  "editstudent/{id}" , method = RequestMethod.POST)
//    public RedirectView EditStudent(@PathVariable("id")int rno,@ModelAttribute("st")Student st)
//    {
//        sdao.UpdateStudent(st);
//        RedirectView r=new RedirectView("/SpringMVCWithModelForm/student");
//        return r;
//    }
//    
//      @RequestMapping(value =  "deletestudent/{id}")
//    public RedirectView DeleteStudent(@PathVariable("id")int rno)
//    {
//        sdao.DeleteStudent(rno);
//        RedirectView r=new RedirectView("/SpringMVCWithModelForm/student");
//        return r;
//    }
}
