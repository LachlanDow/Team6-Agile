import java.sql.*;

public class ListProcedures {
    
    public boolean connectToDatabase() {
        
        try {
            
            //Class.forName("com.mysql.jdbc.Driver");
            
            Connection con = DriverManager.getConnection("jdbc:mysql://162.241.24.176:3306/cammymcn_Team6-Agile", 
                                                         "cammymcn_AglAdm", 
                                                         "Team6Agile");
            
            Statement stmt = con.createStatement();
            
            ResultSet rs = stmt.executeQuery("Select * from Provider");
            
            while (rs.next())
                System.out.println(rs.getInt(1));
            
            return true;
            
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return false;
    };
}