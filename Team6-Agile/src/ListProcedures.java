import java.sql.*;

public class ListProcedures {
    
    public String[][] searchWithCode(String code) {
        String[][] results;
        
        try {            
            ResultSet rs = getConnection().executeQuery("call searchCode('" + code + "')");
            
            int width = 7;
            int height = 0;
            
            rs.last();
            height = rs.getRow();
            
            results = new String[height][width];

            rs.first();
            
            for (int i = 0; i < height; i++) {
                results[i][0] = rs.getString(1);
                results[i][1] = rs.getString(2);
                results[i][2] = rs.getString(3);
                results[i][3] = rs.getString(4);
                results[i][4] = rs.getString(5);
                results[i][5] = rs.getString(6);
                results[i][6] = rs.getString(7);
                rs.next();
            }
            
            return results;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    };
    
    public Statement getConnection() {
        try {            
            Connection con = DriverManager.getConnection("jdbc:mysql://162.241.24.176:3306/cammymcn_Team6-Agile", 
                                                         "cammymcn_AglAdm", 
                                                         "Team6Agile");
            Statement stmt = con.createStatement();
            
            return stmt;
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
}