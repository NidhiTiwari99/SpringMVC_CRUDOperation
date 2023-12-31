package dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import model.*;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
public class StudentDao {
    JdbcTemplate template;
    public JdbcTemplate getTemplate() {
        return template;
    }
    public void setTemplate(JdbcTemplate template) {
        this.template = template;
    }
    public void AddStudent(Student st){
        template.execute("insert into student(rno,name,english,maths,science)values("+st.getRno()+",'"+st.getName()+"',"+st.getEnglish()+","+st.getMaths()+","+st.getScience()+")");
    }
    public void UpdateStudent(Student st){
        template.execute("update student set name='"+st.getName()+"', english="+st.getEnglish()+", maths="+st.getMaths()+", science="+st.getScience()+" where rno="+st.getRno());
    }
    public void DeleteStudent(int rno){
        template.execute("delete from student  where rno="+rno);
    }
    public List<Student>GetStudents(){
        return template.query("select * from student order by rno", new RowMapper<Student>() {
            @Override
            public Student mapRow(ResultSet rs, int i) throws SQLException {
            
                Student st=new Student(rs.getInt("rno"), rs.getString("name"), rs.getFloat("english"), rs.getFloat("maths"), rs.getFloat("science"));
                return st;
            }
        });
    }
    public  Student GetStudent(int rno){
        return template.query("select * from student where rno="+rno, new RowMapper<Student>() {
            @Override
            public Student mapRow(ResultSet rs, int i) throws SQLException {
            
                Student st=new Student(rs.getInt("rno"), rs.getString("name"), rs.getFloat("english"), rs.getFloat("maths"), rs.getFloat("science"));
                return st;
            }
        }).get(0);
    }
}